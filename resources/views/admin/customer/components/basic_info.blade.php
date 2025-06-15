<div class="tab-pane active" id="basic_info">
    <div class="row">    
        <div class="col-md-5">
            <div class="card card-primary card-outline">
                <div class="card-body box-profile">

                    <h3 class="profile-username text-center">{{ ucfirst($customer->name) }}</h3>

                    <p class="text-muted text-center">{{ $customer->email }}</p>

                    <ul class="list-group list-group-unbordered mb-3">
                        <li class="list-group-item">
                            <b>Mobile</b> <a class="float-right">{{ $customer->mobile }}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>