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

                // script to add buses table
                function myFunction(routeId) {
                    console.log("clicked" + routeId);
                    const busTable = $('#bus-table').get(0);
                    busTable.innerHTML =`<tr>
                                            <th>Select a bus</th>
                                            <th>Bus ID</th>
                                            <th>Total Seats</th>
                                            <th>Available Seats</th>
                                        </tr>`;
                    let buses = [];
                    $.ajax({
                        type: "GET",
                        url: "/bus/getByRouteId/" + routeId,
                        data: null,
                        async: false,
                        success: function (response) {
                            buses = response;
                            return response;
                        },
                        error: function () {
                            alert('Buses could not be fetched');
                        }
                    });

                    console.log("Buses fetched = ", buses);
                    // if(buses){
                    //     $('#bus-table-container').append($('<h5>Buses on this route are</h5>'));
                    // }
                    // else{
                    //     $('#bus-table-container').append($('<h5>Bus unavilable on this route</h5>'));
                    // }

                    buses.forEach(bus => {
                        console.log(`<tr>
                                                    <td class="col-md-5 "><a class="btn btn-primary" onclick="myFunction(${1})">Book This Bus</a></td>
                                                    <td class="col-md-5">`+bus.bid+`</td>
                                                    <td class="col-md-5">`+bus.totalSeats+`/td>
                                                    <td class="col-md-5">`+bus.availableSeats+`</td>
                                                </tr>`);
                        busTable.innerHTML +=   `<tr>
                                                    <td class="col-md-5"><a class="btn btn-primary" onclick="myFunction(${1})">Book This Bus</a></td>
                                                    <td class="col-md-5">`+bus.bid+`</td>
                                                    <td class="col-md-5">`+bus.totalSeats+`</td>
                                                    <td class="col-md-5">`+bus.availableSeats+`</td>
                                                </tr>`;
                    });


                }

                // script to add onchange function and create rouets table
                $(document).ready(() => {
                    console.log("on change function added to select");
                    $('#select-stop').on('change', function () {
                        console.log("select stop id = " + $(this).val());
                        var routes = "";
                        $.ajax({
                            type: "GET",
                            url: "/arrivaltime/getallroutes/" + $(this).val(),
                            data: null,
                            async: false,
                            success: function (response) {
                                routes = response;
                                return response;
                            },
                            error: function () {
                                alert('Error occured');
                            }
                        });
                        console.log(routes);
                        document.getElementById('routes-table').innerHTML = `<tr>
                                                                                <th></th>
                                                                                <th>Routes Available through this stop </th>
                                                                            </tr>`
                        document.getElementById('bus-table').innerHTML = "";
                        routes.forEach(route => {
                            stopNames = "";
                            route.forEach(stop => {
                                stopNames += stop?.name + ", "
                            });
                            console.log(stopNames);
                            document.getElementById('routes-table').innerHTML += `<tr>
                                                                                      <td><a class="btn btn-primary" onclick="myFunction(${1})">View Buses On this Route</a></td>
                                                                                      <td>`+ stopNames + `</td>
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

            <div class="align-items-center justify-content-center d-flex p-5">

                <!--Card-->
                <div class="card shadow mb-5 bg-white rounded w-75">

                    <!--Card-Body-->
                    <div class="card-body">

                        <!--Card-Title-->
                        <h2 class="card-title text-center shadow mb-5 rounded">Bus Booking Form</h2>

                        <p class="searchText"><strong>Select your pickup stop</strong></p>
                        <!-- <div class="col-sm-6"> -->
                        <select class="browser-default custom-select mb-4" id="select-stop">
                            <option value="" disabled="" selected="">Select stop</option>
                            stops.foreach
                            <c:forEach items="${stops}" var="stop">
                                <option value=${stop.getSid()}>${stop.getName()}</option>
                            </c:forEach>
                        </select>

                        <!--Second Row to display list of routes on selected stop -->
                        <div class="pt-5 d-flex align-content-center justify-content-center w-100">
                            <table id="routes-table" class="table-striped justify-content-center w-100">
                            </table>
                        </div>

                        <!--Third Row to display list of buses on selected route -->
                        <div class="pt-5 d-flex align-content-center justify-content-center w-100" id="bus-table-container">
                            <table id="bus-table" class="table-striped justify-content-center w-100 p-2">
                            </table>
                        </div>







                    </div>
                </div>
            </div>





        </body>

        </html>