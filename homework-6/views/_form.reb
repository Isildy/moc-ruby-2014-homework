<div class="form-group form-group-lg">
	<%= f.error_messages %>
	<%= f.text_field_block :name, class: "form-control" %>
	<%= f.text_field_block :age, class: "form-control" %>
	<%= f.text_field_block :gender, class: "form-control" %>
</div>
<div class="row">
<div class="col-md-2 col-md-offset-8">
<%= f.submit "Save", class: "btn btn-primary" %>
<%= link_to "Back", "/gladiators", class: "btn btn-success" %>
</div>
</div>