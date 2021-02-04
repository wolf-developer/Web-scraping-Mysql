<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="/assect/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="/assect/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <link rel="stylesheet" href="/assect/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <link rel="stylesheet" href="/assect/plugins/jqvmap/jqvmap.min.css">
  <link rel="stylesheet" href="/assect/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="/assect/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <link rel="stylesheet" href="/assect/plugins/daterangepicker/daterangepicker.css">
  <link rel="stylesheet" href="/assect/plugins/summernote/summernote-bs4.min.css">
  <link rel="stylesheet" href="/assect/plugins/toastr/toastr.min.css">
  <style>
  h4{
      color: #3d9970;
  }
  </style>
</head>
<body>

<div style="margin: 50px 50px; ">





<section class="content-header">
    <div class="container-fluid">
    <div class="row mb-2">
        <div class="col-sm-6">
        <h1>Company Search</h1>
        </div>
        
    </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="row">
    <div class="col-md-12">
        <div class="card card-outline card-info">
            <div class="card-header">
                <div class="input-group mb-3" style="width: 50%; margin-left: 25%" >
                    <input type="search" id="company_search"  class="form-control" aria-label="Search" placeholder="Search">
                    <div class="input-group-append">
                        <button class="input-group-text" onclick="search_company()">
                            <span class="fas fa-search"></span>
                        </button>
                    </div>
                    
                   
                </div>
            </div>
            <div class="card-body" id="companies_result">
                
            </div>
        
        </div>
    </div>
    </div>
</section>




</div>
<div class="modal fade" id="modal-Customer">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title">Company Information</h3>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <h4>Basic Profile</h4>
                <div class="input-group mb-3">
                    <span style="width: 40%">Organization Name</span>
                    <span id="name"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">IRS EIN (Taxpayer Id)</span>
                    <span id="ein"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Doing Business As</span>  
                    <span id="doing_business_as"></span> 
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Type of business</span>
                    <span id="type_of_business"></span>
                </div>

                <h4>Business Address and Contact Details:</h4>
                <div class="input-group mb-3">
                    <span style="width: 40%">Business Phone</span>
                    <span id="phone"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Business Address</span>
                    <span id="address"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Business Address Line 2</span>
                    <span id="address_2"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Business City</span>   
                    <span id="city"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Business State</span>
                    <span id="state"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Business ZIP</span>
                    <span id="zip"></span>
                </div>

                <h4>Mailing Address:</h4>
                <div class="input-group mb-3">
                    <span style="width: 40%">Mailing Address</span>
                    <span id="mailing_address"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Mailing Address2</span>
                    <span id="mailing_address_2"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Mailing City</span>  
                    <span id="mailing_city"></span> 
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Mailing State</span>
                    <span id="mailing_state"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Mailing ZIP</span>
                    <span id="mailing_zip"></span>
                </div>

                <h4>Incorporation Details:</h4>
                <div class="input-group mb-3">
                    <span style="width: 40%">Central Index Key (CIK)</span>
                    <span id="cik"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">End of fiscal year</span>
                    <span id="end_of_fiscal_year"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Incorporation State</span>   
                    <span id="incorporation_state"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Incorporation Sub division</span>
                    <span id="incorporation_sub_division"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Incorporation Country</span>
                    <span id="incorporation_country"></span>
                </div>
                <div class="input-group mb-3">
                    <span style="width: 40%">Filing Year</span>
                    <span id="filing_year"></span>
                </div>

            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <!-- <button type="button" class="btn btn-primary" onclick="add_customer()">Save</button> -->
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
<script src="/assect/plugins/jquery/jquery.min.js"></script>
<script src="/assect/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/assect/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    var temp;
    $(document.body).on("keyup","#company_search",function(){
        var search_content=$("#company_search").val();
        $.post(
            '/index.php/Welcome/search',
            {
                content:search_content
            },
             function(data, status){
                $('#companies_result').html(data);
           
            }
        );
        
    });
    function select_customer(id){
        $.post(
            '/index.php/Welcome/index_read',
            {
                id : id
            },
            function(data, status){
                var tmp = JSON.parse(data);
                $('#name').text(tmp['name']);
                $('#ein').text(tmp['ein']);
                $('#doing_business_as').text(tmp['doing_business_as']);
                $('#type_of_business').text(tmp['type_of_business']);
                $('#phone').text(tmp['phone']);
                $('#address').text(tmp['address']);
                $('#address_2').text(tmp['address_2']);
                $('#city').text(tmp['city']);
                $('#state').text(tmp['state']);
                $('#zip').text(tmp['zip']);
                $('#mailing_address').text(tmp['mailing_address']);
                $('#mailing_address_2').text(tmp['mailing_address_2']);
                $('#mailing_city').text(tmp['mailing_city']);
                $('#mailing_state').text(tmp['mailing_state']);
                $('#mailing_zip').text(tmp['mailing_zip']);
                $('#cik').text(tmp['cik']);
                $('#end_of_fiscal_year').text(tmp['end_of_fiscal_year']);
                $('#incorporation_state').text(tmp['incorporation_state']);
                $('#incorporation_sub_division').text(tmp['incorporation_sub_division']);
                $('#incorporation_country').text(tmp['incorporation_country']);
                $('#filing_year').text(tmp['filing_year']);
                $("#modal-Customer").modal();
            }
        );
        
    }

</script>
</body>
</html>



