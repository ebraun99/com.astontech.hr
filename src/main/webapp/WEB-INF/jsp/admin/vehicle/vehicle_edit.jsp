<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>
<%@include file="../../includes/subnav_admin.jsp"%>

<script>

    $(document).ready(function() {
        // attach an onclick function to the remove buttons
        $('.remove_button').click(function() {
            //log name button, and contents of associated text box
            console.log(this.name);
            console.log($('#'+ this.name).val());
            //clear the value / contents of the textbox
            $('#'+ this.name).val('')
            //submit the form
            $('#elementType').submit();
        });

    });

</script>

<div class="wrapper">

    <%--SIDEBAR HERE--%>
    <%@include file="vehicle_sidebar.jsp"%>

    <div id="main-wrapper" class="col-sm-10">
        <div class="col-sm-8">


            <form:form cssClass="form-horizontal" modelAttribute="vehicleVO" action="/admin/vehicle/edit" method="post" name="edit">


                <c:set var = "vehicleMakeEdit" scope = "page" value = "${vehicleMakeEdit}"/>
                <c:set var = "vehicleModelEdit" scope = "page" value = "${vehicleModelEdit}"/>
                <c:set var = "vehicleEdit" scope = "page" value = "${vehicleEdit}"/>
            <fieldset>
                <Legend>Edit Vehicle</Legend>


                        <select>
                        <c:forEach var="vehicleMake" items="${vehicleMakeList}">
                            <c:choose>
                                <c:when test="${vehicleMakeEdit.id == vehicleMake.id}">
                                    <option selected value="${vehicleMake.id}">${vehicleMake.vehicleMakeName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${vehicleMake.id}">${vehicleMake.vehicleMakeName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        </select>

                        <select>
                            <c:forEach var="vehicleMake" items="${vehicleMakeList}">
                                <c:forEach var="vehicleModel" items="${vehicleMake.vehicleModelList}">
                                    <c:choose>
                                        <c:when test="${vehicleModelEdit.id == vehicleModel.id}">
                                            <option selected value="${vehicleModel.id}">${vehicleModel.vehicleModelName}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${vehicleModel.id}">${vehicleModel.vehicleModelName}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </c:forEach>
                        </select>


                <div class="form-group">
                    <label for="inputNewVehicleOwner" class="col-lg-2 control-label">Vehicle Owner:</label>
                    <div class="col-lg-10">
                        <form:input path="newVehicleOwner" type="text" class="form-control" id="inputNewVehicleOwner" value="${vehicleEdit.ownerName}"></form:input>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputNewVehicleYear" class="col-lg-2 control-label">Vehicle Year:</label>
                    <div class="col-lg-10">
                        <form:input path="newVehicleYear" type="number" class="form-control" id="inputNewVehicleYear" value="${vehicleEdit.year}"></form:input>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputNewVehicleVIN" class="col-lg-2 control-label">Vehicle VIN:</label>
                    <div class="col-lg-10">
                        <form:input path="newVehicleVIN" type="text" class="form-control" id="inputNewVehicleVIN" value="${vehicleEdit.VIN}"></form:input>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputNewVehicleColor" class="col-lg-2 control-label">Vehicle Color:</label>
                    <div class="col-lg-10">
                        <form:input path="newVehicleColor" type="text" class="form-control" id="inputNewVehicleColor" value="${vehicleEdit.color}"></form:input>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputNewVehicleLicensePlate" class="col-lg-2 control-label">Vehicle License Plate:</label>
                    <div class="col-lg-10">
                        <form:input path="newVehicleLicensePlate" type="text" class="form-control" id="inputNewVehicleLicensePlate" value="${vehicleEdit.licensePlate}"></form:input>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-10">
                        <hr>
                    </div>
                </div>

                <div class="row">
                    <button class="btn btn-primary">Update</button>
                </div>

            </fieldset>
            </form:form>

        </div>

        <div class="col-sm-4">

            <%--ALERTS--%>
            <%--Success Alert--%>
            <%--? is short for if else--%>
            <div class="${successAlert == null ? 'hidden' : successAlert}" id="successAlert">
                <div class="alert alert-dismissible alert-success">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Well done!</strong> You successfully read <a href="#" class="alert-link">this important alert message</a>.
                </div>
            </div>

            <%--Warning Alert--%>
            <div class="${warningAlert == null ? 'hidden' : warningAlert}" id="warningAlert">
                <div class="alert alert-dismissible alert-warning">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <h4>Warning!</h4>
                    <p>Best check yo self, you're not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, <a href="#" class="alert-link">vel scelerisque nisl consectetur et</a>.</p>
                </div>
            </div>

            <%--Error Alert--%>
            <div class="${errorAlert == null ? 'hidden' : errorAlert}" id="errorAlert">
                <div class="alert alert-dismissible alert-danger">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Oh snap!</strong> <a href="#" class="alert-link">Change a few things up</a> and try submitting again.
                </div>
            </div>

        </div>
    </div>
</div>


<%@include file="../../includes/footer.jsp"%>