<div class="tab-pane active" id="basic_info">
    <div class="col-md-3">

        <!-- Profile Image -->
        <div class="card card-primary card-outline">
            <div class="card-body box-profile">
               

                <h3 class="profile-username text-center">{{ ucfirst($customer->name) }}</h3>

                <p class="text-muted text-center">{{ $customer->role }}</p>

                <ul class="list-group list-group-unbordered mb-3">
                    <li class="list-group-item">
                        <b>Email</b> <a class="float-right">{{ $customer->email }}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Mobile</b> <a class="float-right">{{ $customer->mobile }}</a>
                    </li>
                    <li class="list-group-item">
                        <b>Status</b> <a class="float-right">{{ $customer->status }}</a>
                    </li>
                </ul>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->

    </div>

</div>