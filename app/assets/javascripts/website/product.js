$(document).ready(function(){
  $("#product_company_id").change(function(){
  	if (this.value == "") {
      $("#companyForm").show();
  	} else {
  		$("#companyForm").hide();
  	}
  });
  if ($("#product_company_id").value != undefined) {  	
  	$("#companyForm").hide();
  }
});