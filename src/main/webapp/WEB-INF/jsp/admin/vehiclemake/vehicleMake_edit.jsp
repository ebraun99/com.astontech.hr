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
    <%@include file="../vehicle/vehicle_sidebar.jsp"%>

    <div id="main-wrapper" class="col-sm-10">
        <div class="col-sm-8">

            <c:set var="idx" value="0" scope="page" />
            <form:form cssClass="form-horizontal" modelAttribute="vehicleMake" action="/admin/vehicleMake/update" method="post">
                <form:hidden path="id" />
                <form:hidden path="version" />

                <div class="row">
                    <div class="form-group">
                        <label for="inputVehicleMake" class="col-sm-2 control-label">Element Type</label>
                        <div class="col-sm-8">
                            <form:input path="vehicleMakeName" type="text" id="inputVehicleMake" cssClass="form-control"></form:input>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-10">
                        <hr>
                    </div>
                </div>

                <c:forEach items="${vehicleMake.vehicleModelList}" var="vehicleModel">
                    <form:hidden path="vehicleModelList[${idx}].id" />
                    <form:hidden path="vehicleModelList[${idx}].version" />
                    <div class="row">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="${idx}">Vehicle Model</label>
                            <div class="col-sm-7">
                                <div class="input-group">
                                    <form:input path="vehicleModelList[${idx}].vehicleModelName" id="${idx}" cssClass="form-control"></form:input>
                                        <span class="input-group-btn">
                                            <button name="${idx}" class="btn btn-default remove_button" type="button">Remove</button>
                                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:set var="idx" value="${idx + 1}" scope="page" />
                </c:forEach>

                <div class="row">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="inputNewModel">Add new Model</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="inputNewModel" id="inputNewModel"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <button class="btn btn-primary">Update</button>
                </div>

            </form:form>

        </div>
    </div>
</div>


<%@include file="../../includes/footer.jsp"%>