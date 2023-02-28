<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
            </script>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
            </script>

            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">
            </script>

            <script>

                $(document).ready(()=>{
                    console.log("on change function added to select");
                    $('#select-stop').on('change',function() {
                        console.log("select stop id = "+$(this).val());
                        var routes = "";
                        $.ajax({
                            type:"GET",
                            url : "/arrivaltime/getallroutes/"+$(this).val(),
                            data : null,
                            async: false,
                            success : function(response) {
                                routes = response;
                                return response;
                            },
                            error: function() {
                                alert('Error occured');
                            }
                        });
                        console.log(routes);
                        document.getElementById('routes-table').innerHTML += document.getElementById('routes-table').innerHTML += `<tr><th></th><th>Routes Available through this stop </th></tr>`
                        routes.forEach(route => {
                            stopNames = "";
                            route.forEach(stop => {
                                stopNames += stop?.name + ", "
                            });
                            console.log(stopNames);
                            document.getElementById('routes-table').innerHTML += `<tr>
                                                                                      <td><a class="btn btn-primary">Book</a></td>
                                                                                      <td>`+stopNames+`</td>
                                                                                  </tr>`;
                        });
                        // var string = data.message.split(",");
                        // var array = string.filter(function(e){return e;});
                        // var select = $('selectbox2');
                        // select.empty();
                        // $.each(array, function(index, value) {          
                        //     select.append(
                        //             $('<option></option>').val(value).html(value)
                        //         );
                        // });
                        //     $('#selectbox2').show();
                        // });
                })
                
                    
                });
            </script>


        </head>

        <body class="bg-dark vh-100">

            <!-- navbar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light " style="height:10vh">
                <a class="navbar-brand" href="/">
                    <h1>Bus Management System</h1>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse text-primary bg-light align-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/employee/dashboard">
                                <h4>Home</h4>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/employee/edit">
                                <h4>Edit Profile</h4>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/employee/book">
                                <h4>Book Bus</h4>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <h4> Sign Out</h4>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="align-items-center justify-content-center d-flex p-5" >

                <!--Card-->
                <div class="card shadow mb-5 bg-white rounded">

                    <!--Card-Body-->
                    <div class="card-body">

                        <!--Card-Title-->
                        <h2 class="card-title text-center shadow mb-5 rounded">Bus Booking Form</h2>

                        <p class="searchText"><strong>Select your pickup stop</strong></p>
                        <!-- <div class="col-sm-6"> -->
                        <select class="browser-default custom-select mb-4" id="select-stop">
                            <option value="" disabled="" selected="">Select stop</option>
                            <c:forEach items="${stops}" var="stop">
                                <option value=${stop.getSid()}>${stop.getName()}</option>
                            </c:forEach>
                        </select>

                        <!--Second Row to display list of routes on selected stop -->
                        <div class="row">
                            <table id="routes-table">
                            </table>                            
                        </div>


                        <%-- <!--Third Row-->
                        <div class="row">

                            <div class="col-sm-6">
                                <input placeholder="&#xf073; Departing" type="text" id="date-picker-example"
                                    class="form-control datepicker mb-4" style="font-family:Arial, FontAwesome">
                            </div>

                            <div class="col-sm-6">
                                <input placeholder="&#xf073; Arriving" type="text" id="date-picker-example"
                                    class="form-control datepicker" style="font-family:Arial, FontAwesome">
                            </div>

                        </div>


                        <!--Fourth Row-->
                        <div class="row mt-4">

                            <div class="col-sm-6">
                                <select class="browser-default custom-select mb-4" id="select">
                                    <option value="" disabled="" selected="">Anytime</option>
                                    <option value="1">6:00 AM</option>
                                    <option value="2">3:00 PM</option>
                                    <option value="3">6:00 PM</option>
                                </select>
                            </div>

                            <div class="col-sm-6">
                                <select class="browser-default custom-select mb-4" id="select">
                                    <option value="" disabled="" selected="">Anytime</option>
                                    <option value="1">6:00 AM</option>
                                    <option value="2">3:00 PM</option>
                                    <option value="3">6:00 PM</option>
                                </select>
                            </div>

                        </div>




                        <!--Fifth Row-->
                        <div class="row">

                            <div class="col-sm-4">
                                <select class="browser-default custom-select mb-4" id="select">
                                    <option value="" disabled="" selected="">Kids(0-14)</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>

                            <div class="col-sm-4">
                                <select class="browser-default custom-select mb-4" id="select">
                                    <option value="" disabled="" selected="">Adults(15-64)</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>

                            <div class="col-sm-4">
                                <select class="browser-default custom-select mb-4" id="select">
                                    <option value="" disabled="" selected="">Seniors(65+)</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>



                        </div> --%>

                        <a href="#" class="btn btn-primary float-right mt-5">Find Flights</a>
                    </div>
                </div>
            </div>





        </body>

        </html>