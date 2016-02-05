<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<portlet:defineObjects />
<style>
#userData td{
font-weight: bold;
width:200px;
border: 1px solid gary;
}
</style>
<script>
Liferay.on(
'getUserData',function(event) {
jQuery('#userInformation').empty();
jQuery('#errorInformation').empty();
if(event.userData.error!=null){
	jQuery('#errorInformation').html(event.userData.error);
}else{
var htmlString="<table id='userData'>"+
"<tr><td>User Id</td><td>"+event.userData.userId+"</td></tr>"+
"<tr><td>First Name</td><td>"+event.userData.firstName+"</td></tr>"+
"<tr><td>Last Name</td><td>"+event.userData.lastName+"</td></tr>"+
"<tr><td>Email Address</td><td>"+event.userData.emailAddress+"</td></tr>"+
"</table>";
jQuery('#userInformation').html(htmlString);
}
}
);
</script>

<div id="userInformation"></div>
<div id="errorInformation" style="color:red;font-weight:bold;"></div>