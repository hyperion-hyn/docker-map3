(window.webpackJsonp=window.webpackJsonp||[]).push([[0],{119:function(e,t,n){e.exports=n(290)},124:function(e,t,n){},126:function(e,t,n){},290:function(e,t,n){"use strict";n.r(t);var a=n(1),o=n.n(a),r=n(22),i=n.n(r),c=(n(124),n(107)),s=n(6),l=n(5),m=n(13),p=n(9),h=n(14),u=(n(126),n(118)),d=n(43),f=n.n(d),g=n(42),v=n.n(g),w=n(111),b=n.n(w),y=n(113),E=n.n(y),C=n(117),k=n.n(C),N=n(115),S=n.n(N),x=n(116),j=n.n(x),A=n(114),H=n.n(A),O=n(44),_=n.n(O),D=n(112),I=n.n(D),J=n(62),T=function(e){function t(){var e,n;Object(s.a)(this,t);for(var a=arguments.length,o=new Array(a),r=0;r<a;r++)o[r]=arguments[r];return(n=Object(m.a)(this,(e=Object(p.a)(t)).call.apply(e,[this].concat(o)))).state={viewport:{latitude:22.30511,longitude:114.188488,zoom:10,width:"100vw",height:"100vh"},style:"",host:"",contact:"",open:!1,committing:!1,nodeName:"",contractAddr:"",txHash:"",ownerName:""},n._onViewportChange=function(e){e.width="100vw",e.height="100vh",n.setState({viewport:e})},n._updateCurrentLocation=function(){navigator.geolocation.getCurrentPosition(function(e){var t=Object(c.a)({},n.state.viewport);t.longitude=e.coords.longitude,t.latitude=e.coords.latitude,n.setState({viewport:t}),console.log("get location",e)},function(e){console.warn(e)})},n.handleClickOpen=function(){n.setState({open:!0})},n.handleClose=function(){n.setState({open:!1})},n.handleSubmit=function(e){e.preventDefault(),n.state.host&&(console.log("email",n.state.contact),n.setState({committing:!0}),fetch("https://api.hyn.space/api/v1/tile/feedback",{method:"POST",headers:new Headers({"Content-Type":"application/x-www-form-urlencoded"}),body:"ip=".concat(n.state.host,"&contact=").concat(n.state.contact)}).then(function(e){return e.json()}).then(function(e){n.setState({committing:!1,open:!1})}))},n.onContactInputChange=function(e){n.setState({contact:e.target.value,contactError:!1})},n}return Object(h.a)(t,e),Object(l.a)(t,[{key:"componentWillMount",value:function(){var e=this,t=window.location.host,n=document.location.protocol+"//"+t+"/api/v1/hyn/map3/{z}/{x}/{y}.pbf";this.setState({host:t}),fetch("https://api.hyn.space/api/v1/tile/feedback/check?ip=".concat(t)).then(function(e){return e.json()}).then(function(t){console.log(t),!1===t.data&&e.setState({open:!0})}),fetch("node-info.json").then(function(e){return e.json()}).then(function(t){e.setState({nodeName:t.nodeName}),e.setState({contractAddr:t.contractAddr}),e.setState({ownerName:t.ownerName}),e.setState({txHash:t.txHash})}),fetch("styles/basic.json").then(function(e){return e.json()}).then(function(e){return e.sources.composite.tiles.push(n),e}).then(function(t){e.setState({style:t})}).catch(function(e){console.warn(e)})}},{key:"componentDidMount",value:function(){this._updateCurrentLocation()}},{key:"render",value:function(){var e=this,t=this.state,n=t.viewport,a=t.style,r=t.host,i=t.nodeName,c=t.contractAddr,s=t.ownerName,l=t.txHash,m="",p="View Contract";""!==s&&""!==l?(p="Created by "+s+"("+(c.substring(0,8)+"..."+c.substring(34,c.length))+")",m="https://cn.etherscan.com/tx/"+l):""!==i&&""!==c?m="https://cn.etherscan.com/tx/"+c:i=r;return o.a.createElement("div",{className:"App"},o.a.createElement(u.a,Object.assign({ref:function(t){return e.mapRef=t}},n,{mapStyle:a,onViewportChange:this._onViewportChange,mapOptions:{localIdeographFontFamily:"'Noto Sans', 'Noto Sans CJK SC', sans-serif",attributionControl:!1},mapboxApiAccessToken:"pk.eyJ1IjoiaHlwZXJpb25sYWIiLCJhIjoiY2pwYXNvbTJiMm90ZjNxcDd3Y3kxNGtmYiJ9.s-np__x-B_MgHvp06NxV5w"})),o.a.createElement("div",{className:"App-Container"},o.a.createElement("div",{className:"App-Top-Nav"},o.a.createElement("span",{className:"circle"}),o.a.createElement("div",{style:{paddingLeft:"8px"}},i," ",""!==m&&o.a.createElement("a",{href:m,rel:"noopener noreferrer",target:"_blank",className:"node"},o.a.createElement("span",{style:{marginLeft:"8px"}},p))),o.a.createElement("div",{style:{flex:1}}),o.a.createElement("a",{href:"http://".concat(r,":3000"),rel:"noopener noreferrer",target:"_blank",className:"dashboard"},o.a.createElement(b.a,null,"Dashboard"),o.a.createElement("div",{style:{marginLeft:"8px"}},"DASHBOARD"))),o.a.createElement(v.a,{elevation:1,className:"App-Guide",square:!0},o.a.createElement(f.a,null,"Tips: This map is to test if your service node works normally. If you see this map, it means your node is providing map services. ")),o.a.createElement("div",{className:"fab-help"},o.a.createElement(I.a,{href:"https://talk.hyn.space/",target:"_blank",rel:"noopener noreferrer",color:"secondary",size:"large"},"Forum")),o.a.createElement(E.a,{open:this.state.open,onClose:this.handleClose,disableBackdropClick:!0,disableEscapeKeyDown:!0,"aria-labelledby":"form-dialog-title"},o.a.createElement(J.ValidatorForm,{onSubmit:this.handleSubmit,onError:function(e){return console.warn(e)}},o.a.createElement(H.a,{id:"form-dialog-title"},"Support Us"),o.a.createElement(S.a,null,o.a.createElement(j.a,null,"Dear friend, welcome to join Hyperion Map3 network, and become an important member of Hyperion community. Please leave your contact information below to help us improve our service."),o.a.createElement(J.TextValidator,{autoFocus:!0,margin:"dense",id:"name",name:"contact",value:this.state.contact,label:"Email or Phone Number",fullWidth:!0,validators:["required"],errorMessages:["* this field is required"],onChange:this.onContactInputChange,disabled:this.state.committing}),o.a.createElement("div",{className:"link-discuss"},o.a.createElement("a",{href:"https://talk.hyn.space/",target:"_blank",rel:"noopener noreferrer"},"Come share your ideas in Hyperion Forum!"))),o.a.createElement(k.a,null,o.a.createElement(_.a,{onClick:this.handleClose,color:"primary",disabled:this.state.committing},"Cancel"),o.a.createElement(_.a,{type:"submit",disabled:this.state.committing,color:"primary"},"Submit"))))))}}]),t}(a.Component);Boolean("localhost"===window.location.hostname||"[::1]"===window.location.hostname||window.location.hostname.match(/^127(?:\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}$/));n(288);i.a.render(o.a.createElement(T,null),document.getElementById("root")),"serviceWorker"in navigator&&navigator.serviceWorker.ready.then(function(e){e.unregister()})}},[[119,2,1]]]);
//# sourceMappingURL=main.c33ed44c.chunk.js.map