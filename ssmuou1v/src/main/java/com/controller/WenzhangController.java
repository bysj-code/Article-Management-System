package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.WenzhangEntity;
import com.entity.view.WenzhangView;

import com.service.WenzhangService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 文章
 * 后端接口
 * @author 
 * @email 
 * @date 2021-04-06 17:29:02
 */
@RestController
@RequestMapping("/wenzhang")
public class WenzhangController {
    @Autowired
    private WenzhangService wenzhangService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,WenzhangEntity wenzhang, 
		HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("zuozhe")) {
			wenzhang.setZuozhezhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<WenzhangEntity> ew = new EntityWrapper<WenzhangEntity>();
		PageUtils page = wenzhangService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, wenzhang), params), params));
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,WenzhangEntity wenzhang, HttpServletRequest request){

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("zuozhe")) {
			wenzhang.setZuozhezhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<WenzhangEntity> ew = new EntityWrapper<WenzhangEntity>();
		PageUtils page = wenzhangService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, wenzhang), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( WenzhangEntity wenzhang){
       	EntityWrapper<WenzhangEntity> ew = new EntityWrapper<WenzhangEntity>();
      	ew.allEq(MPUtil.allEQMapPre( wenzhang, "wenzhang")); 
        return R.ok().put("data", wenzhangService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(WenzhangEntity wenzhang){
        EntityWrapper< WenzhangEntity> ew = new EntityWrapper< WenzhangEntity>();
 		ew.allEq(MPUtil.allEQMapPre( wenzhang, "wenzhang")); 
		WenzhangView wenzhangView =  wenzhangService.selectView(ew);
		return R.ok("查询文章成功").put("data", wenzhangView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        WenzhangEntity wenzhang = wenzhangService.selectById(id);
		wenzhang.setClicktime(new Date());
		wenzhangService.updateById(wenzhang);
        return R.ok().put("data", wenzhang);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        WenzhangEntity wenzhang = wenzhangService.selectById(id);
		wenzhang.setClicktime(new Date());
		wenzhangService.updateById(wenzhang);
        return R.ok().put("data", wenzhang);
    }
    


    /**
     * 赞或踩
     */
    @RequestMapping("/thumbsup/{id}")
    public R thumbsup(@PathVariable("id") String id,String type){
        WenzhangEntity wenzhang = wenzhangService.selectById(id);
        if(type.equals("1")) {
        	wenzhang.setThumbsupnum(wenzhang.getThumbsupnum()+1);
        } else {
        	wenzhang.setCrazilynum(wenzhang.getCrazilynum()+1);
        }
        wenzhangService.updateById(wenzhang);
        return R.ok();
    }

    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody WenzhangEntity wenzhang, HttpServletRequest request){
    	wenzhang.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(wenzhang);

        wenzhangService.insert(wenzhang);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody WenzhangEntity wenzhang, HttpServletRequest request){
    	wenzhang.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(wenzhang);
    	wenzhang.setUserid((Long)request.getSession().getAttribute("userId"));

        wenzhangService.insert(wenzhang);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody WenzhangEntity wenzhang, HttpServletRequest request){
        //ValidatorUtils.validateEntity(wenzhang);
        wenzhangService.updateById(wenzhang);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        wenzhangService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<WenzhangEntity> wrapper = new EntityWrapper<WenzhangEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("zuozhe")) {
			wrapper.eq("zuozhezhanghao", (String)request.getSession().getAttribute("username"));
		}

		int count = wenzhangService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	/**
     * 前端智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,WenzhangEntity wenzhang, HttpServletRequest request,String pre){
        EntityWrapper<WenzhangEntity> ew = new EntityWrapper<WenzhangEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicktime");
        
        params.put("order", "desc");
		PageUtils page = wenzhangService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, wenzhang), params), params));
        return R.ok().put("data", page);
    }


}
