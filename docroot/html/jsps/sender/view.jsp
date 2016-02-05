<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ page import="com.liferay.portal.kernel.portlet.LiferayWindowState" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<portlet:defineObjects />
<liferay-theme:defineObjects />
<portlet:resourceURL var="getUserData">
</portlet:resourceURL>
<script>
$(document).on('ready',function(){
jQuery('#<portlet:namespace/>getUserByEmail').click(function(event) {
var emailAddessValue = jQuery('#<portlet:namespace/>emailAddess').val();
  $.ajax({
	      url:'<%=getUserData%>',
	      dataType: "json",
	      data:{emailAddess:emailAddessValue,
	      		companyId:'<%=themeDisplay.getCompanyId()%>'
	      		},
	      type: "get",
	      success: function(data){
	    	 Liferay.fire('getUserData', {userData:data});
	      },
	      beforeSend: function(){
	    	  //before send this method will be called
			},
			complete: function(){
				//after completed request then this method will be called.
			},
	      error: function(){
	        $('#userContent').html('<span style="color:red">Connection problems</span>');
	      }
	    });
});
});
</script>
<aui:form method="POST" action="<%=getUserData%>" >
<aui:input type="text" name="emailAddess"   id="emailAddess" label="Email Address"/>
<aui:button type="button" name="getUserByEmail" value="Send" id="getUserByEmail" />
</aui:form>
