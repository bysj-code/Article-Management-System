(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/forum-add-or-update/forum-add-or-update"],{"1a89":function(t,n,e){"use strict";var u=e("30fd"),r=e.n(u);r.a},"30fd":function(t,n,e){},4012:function(t,n,e){"use strict";(function(t){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var u=r(e("a34a"));function r(t){return t&&t.__esModule?t:{default:t}}function a(t,n,e,u,r,a,i){try{var o=t[a](i),s=o.value}catch(c){return void e(c)}o.done?n(s):Promise.resolve(s).then(u,r)}function i(t){return function(){var n=this,e=arguments;return new Promise((function(u,r){var i=t.apply(n,e);function o(t){a(i,u,r,o,s,"next",t)}function s(t){a(i,u,r,o,s,"throw",t)}o(void 0)}))}}var o={data:function(){return{forum:{content:"",id:"",title:"",isdone:"开放",parentid:0},index:0,options:["开放","关闭"],username:"",user:{}}},onLoad:function(){var n=i(u.default.mark((function n(e){var r,a,i;return u.default.wrap((function(n){while(1)switch(n.prev=n.next){case 0:return r=t.getStorageSync("nowTable"),n.next=3,this.$api.session(r);case 3:if(a=n.sent,this.user=a.data,"yonghu"==r&&(this.username=this.user.yonghuzhanghao),"zuozhe"==r&&(this.username=this.user.zuozhezhanghao),!e.id){n.next=13;break}return this.id=e.id,n.next=11,this.$api.info("forum",this.id);case 11:i=n.sent,this.forum=i.data;case 13:this.styleChange();case 14:case"end":return n.stop()}}),n,this)})));function e(t){return n.apply(this,arguments)}return e}(),methods:{styleChange:function(){this.$nextTick((function(){}))},onSubmitTap:function(){var t=i(u.default.mark((function t(){return u.default.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(this.forum.username=this.username,!this.id){t.next=6;break}return t.next=4,this.$api.update("forum",this.forum);case 4:t.next=8;break;case 6:return t.next=8,this.$api.save("forum",this.forum);case 8:this.$utils.msgBack("操作成功");case 9:case"end":return t.stop()}}),t,this)})));function n(){return t.apply(this,arguments)}return n}(),setIsDoneTap:function(t){this.index=t.target.value,this.forum.isdone=this.options[this.index]}}};n.default=o}).call(this,e("543d")["default"])},"5a15":function(t,n,e){"use strict";var u,r=function(){var t=this,n=t.$createElement;t._self._c},a=[];e.d(n,"b",(function(){return r})),e.d(n,"c",(function(){return a})),e.d(n,"a",(function(){return u}))},a92f:function(t,n,e){"use strict";e.r(n);var u=e("4012"),r=e.n(u);for(var a in u)"default"!==a&&function(t){e.d(n,t,(function(){return u[t]}))}(a);n["default"]=r.a},db28:function(t,n,e){"use strict";(function(t){e("64f1"),e("921b");u(e("66fd"));var n=u(e("ee62"));function u(t){return t&&t.__esModule?t:{default:t}}t(n.default)}).call(this,e("543d")["createPage"])},ee62:function(t,n,e){"use strict";e.r(n);var u=e("5a15"),r=e("a92f");for(var a in r)"default"!==a&&function(t){e.d(n,t,(function(){return r[t]}))}(a);e("1a89");var i,o=e("f0c5"),s=Object(o["a"])(r["default"],u["b"],u["c"],!1,null,null,null,!1,u["a"],i);n["default"]=s.exports}},[["db28","common/runtime","common/vendor"]]]);