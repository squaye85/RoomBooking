<!---================= Room Booking System / https://github.com/neokoenig =======================--->
<!--- Gets injected into modal--->
<cfparam name="event">
<cfoutput>
<cfif checkPermission("allowRoomBooking")> 
<div class="btn-group">
	#linkTo(action="edit", key=event.eventid, text="Edit", controller="bookings", class="btn btn-info")#
	#linkTo(action="delete", key=event.eventid, text="Delete", controller="bookings", class="btn btn-danger", confirm="Are you sure?")#
</div>
</cfif>
<cfif checkPermission("viewRoomBooking")> 
<h4>#h(event.title)#</h4>
<p>#formatDate(event.start)# - #formatDate(event.end)#</p>
<p>Location: #h(event.name)#<br />#h(event.description)#</p>
<cfif len(event.description)><p>#h(event.eventdescription)#</p></cfif>
<p>(#event.layoutstyle# Style)</p>
<h4>Contact Details:</h4>
<cfif len(event.contactname) OR len(event.contactemail) OR len(event.contactno)>
	<p>
<cfif len(event.contactname)>
#h(event.contactname)#<br />
</cfif>
<cfif len(event.contactemail)>
#autolink(event.contactemail)#<br />
</cfif>
<cfif len(event.contactno)>
#h(event.contactno)#
</cfif>
</p>
	<cfelse>
		<p>None provided</p>
</cfif>
<cfelse>
	<p>You're not allowed to view the booking details</p>
</cfif>
</cfoutput>