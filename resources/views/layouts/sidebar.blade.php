<aside class="main-sidebar sidebar-primary">
    <!-- Brand Logo -->
    <!-- <a href="#" class="brand-link">
      <img src="/logo/DFLogo1.jpg" alt="Madurai Kadai Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-dark">Madurai Kadai</span>
    </a> -->

    <!-- Sidebar -->
    <div class="sidebar">
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/assets/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="{{ route('home') }}" class="d-block">{{ ucfirst(Auth::user()->name) }}</a>
        </div>
      </div>
    <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!-- Add icons to the links using the .nav-icon class
                with font-awesome or any other icon font library -->
            <li class="nav-item">
                <a href="{{ route('dashboard') }}" class="nav-link {{ (request()->segment(2) == 'dashboard') ? 'active' : '' }}">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p> Dashboard</p>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ route('product.list') }}" class="nav-link {{ (request()->segment(2) == 'product') ? 'active' : '' }}">
                <i class="nav-icon fas fa-book"></i>
                <p> Products</p>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ route('order.list') }}" class="nav-link {{ (request()->segment(2) == 'order'&& (request()->segment(3) != 'customer' && request()->segment(3) != 'summary')) ? 'active' : '' }}">
                <i class="nav-icon fas fa-newspaper"></i>
                <p> Orders</p>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ route('order.customers') }}" class="nav-link {{ (request()->segment(2) == 'order' && request()->segment(3) == 'customer') ? 'active' : '' }}">
                <i class="nav-icon fas fa-users"></i>
                <p> Customers</p>
                </a>
            </li>
            <li class="nav-item">
                <a href="{{ route('analytics.index') }}" class="nav-link {{ (request()->segment(2) == 'analytics') ? 'active' : '' }}">
                <i class="nav-icon fas fa-cog"></i>
                <p> Analytics</p>
                </a>
            </li>
            <li class="nav-item">
              <a href="{{ route('discount.index') }}" class="nav-link {{ (request()->segment(2) == 'discount') ? 'active' : '' }}">
                <i class="nav-icon fas fa-clock"></i>
                <p> Discount</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="" class="nav-link {{ (request()->segment(2) == 'introducer') ? 'active' : '' }}">
                <i class="nav-icon fas fa-users"></i>
                <p> Referral</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="" class="nav-link {{ (request()->segment(2) == 'country') ? 'active' : '' }}">
                <i class="nav-icon fas fa-flag"></i>
                <p> Inventory</p>
              </a>
            </li>
            <li class="nav-item has-treeview {{ (request()->segment(2) == 'reports') ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->segment(2) == 'reports') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-money-bill"></i>
                    <p> Reports <i class="fas fa-angle-left right"></i> </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('reports.index') }}" class="nav-link {{ (request()->segment(2) == 'reports') && (request()->segment(3) == 'customer') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Sales wise report</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('reports.monthly') }}" class="nav-link {{ (request()->segment(2) == 'reports') && (request()->segment(3) == 'month') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Month wise report</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('reports.daily') }}" class="nav-link {{ (request()->segment(2) == 'reports') && (request()->segment(3) == 'daily') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Daily wise report</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('reports.pendingpayment') }}" class="nav-link {{ (request()->segment(2) == 'reports') && (request()->segment(3) == 'pendingpayment') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Product wise report</p>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item has-treeview {{ in_array(request()->segment(2), ['configuration', 'category', 'subcategory', 'banner', 'mobile-banner', 'news', 'delivery-area', 'delivery-slot', 'promo-code']) ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ in_array(request()->segment(2), ['configuration', 'category', 'subcategory', 'banner', 'mobile-banner', 'news', 'delivery-area', 'delivery-slot', 'promo-code']) ? 'active' : '' }}">
                    <i class="nav-icon fas fa-star"></i>
                    <p> Configuration <i class="fas fa-angle-left right"></i> </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('category.list') }}" class="nav-link {{ (request()->segment(2) == 'category') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p> Category</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('subcategory.list') }}" class="nav-link {{ (request()->segment(2) == 'subcategory') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p> Subcategory</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('banner.list') }}" class="nav-link {{ (request()->segment(2) == 'banner') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p> Banner</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('mobile.banner.list') }}" class="nav-link {{ (request()->segment(2) == 'mobile-banner') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p> Mobile Banner</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('news.list') }}" class="nav-link {{ (request()->segment(2) == 'news') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p> News</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('delivery.area.list') }}" class="nav-link {{ (request()->segment(2) == 'delivery-area') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p> Delivery Area</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('delivery.slot.list') }}" class="nav-link {{ (request()->segment(2) == 'delivery-slot') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p> Delivery Slot</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('promocode.list') }}" class="nav-link {{ (request()->segment(2) == 'promo-code') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p> Promocode</p>
                        </a>
                    </li>
                </ul>
            </li>
            
            <li  class="nav-item">
                <a class="nav-link" role="button" href="{{ route('user.logout') }}"
                    onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();">
                    <i class="nav-icon fas fa-sign-out-alt"> </i>
                    <p> Logout</p>
                </a>
            </li>
            <form id="logout-form" action="{{ route('user.logout') }}" method="POST" class="d-none">
                @csrf
            </form>

        </ul>
    </nav>


      <!-- Sidebar Menu -->
      <nav class="mt-2" style="display:none">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
            <li class="nav-item">
                <a href="{{ route('dashboard') }}" class="nav-link {{ (request()->segment(2) == 'dashboard') ? 'active' : '' }}">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p> Dashboard</p>
                </a>
            </li>

            <li class="nav-item has-treeview {{ (request()->segment(2) == 'user') ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->segment(2) == 'user') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-users"></i>
                    <p> Users <i class="fas fa-angle-left right"></i> </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('user.create') }}" class="nav-link {{ (request()->segment(2) == 'user') && (request()->segment(3) == 'create') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Add User</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('user.list') }}" class="nav-link {{ (request()->segment(2) == 'user') && (request()->segment(3) == 'list') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>User List</p>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item has-treeview {{ (request()->segment(2) == 'vendor') ? 'menu-open' : '' }}">
                <a href="#" class="nav-link {{ (request()->segment(2) == 'vendor') ? 'active' : '' }}">
                    <i class="nav-icon fas fa-users"></i>
                    <p> Vendors <i class="fas fa-angle-left right"></i> </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('vendor.create') }}" class="nav-link {{ (request()->segment(2) == 'vendor') && (request()->segment(3) == 'create') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Add Vendor</p>
                        </a>
                    </li>
                </ul>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('vendor.list') }}" class="nav-link {{ (request()->segment(2) == 'vendor') && (request()->segment(3) == 'list') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Vendors List</p>
                        </a>
                    </li>
                </ul>
                 <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('vendors-product.list') }}" class="nav-link {{ (request()->segment(2) == 'vendors-product') && (request()->segment(3) == 'list') ? 'active' : '' }}">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Vendors Products</p>
                        </a>
                    </li>
                </ul>
            </li>


            <li class="nav-item">
                <a href="{{ route('customer.list') }}" class="nav-link {{ ((request()->segment(2) == 'customer') && (request()->segment(3) == 'list' || request()->segment(3) == 'view') || (request()->segment(2) == 'notification' && request()->segment(3) == 'customer') ) ? 'active' : '' }}">
                <i class="nav-icon fas fa-newspaper"></i>
                <p>Customers</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('rider.list') }}" class="nav-link {{ ((request()->segment(2) == 'rider') && (request()->segment(3) == 'list' || request()->segment(3) == 'view' || request()->segment(3) == 'create') || (request()->segment(2) == 'notification' && request()->segment(3) == 'rider') ) ? 'active' : '' }}">
                <i class="nav-icon fas fa-newspaper"></i>
                <p>Riders</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('setting.edit') }}" class="nav-link {{ (request()->segment(2) == 'settings') ? 'active' : '' }}">
                <i class="nav-icon fas fa-cog"></i>
                <p> Settings</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('billing.add') }}" class="nav-link {{ (request()->segment(2) == 'billing') ? 'active' : '' }}">
                <i class="nav-icon fas fa-money-bill"></i>
                <p> Billing</p>
                </a>
            </li>
            
        <li class="nav-header">Configuration</li>

            <li class="nav-item">
                <a href="{{ route('category.list') }}" class="nav-link {{ (request()->segment(2) == 'category') ? 'active' : '' }}">
                <i class="nav-icon fas fa-list-alt"></i>
                <p> Category</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('subcategory.list') }}" class="nav-link {{ (request()->segment(2) == 'subcategory') ? 'active' : '' }}">
                <i class="nav-icon fas fa-list-alt"></i>
                <p> Subcategory</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('banner.list') }}" class="nav-link {{ (request()->segment(2) == 'banner') ? 'active' : '' }}">
                <i class="nav-icon fas fa-clock"></i>
                <p> Banner</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('mobile.banner.list') }}" class="nav-link {{ (request()->segment(2) == 'mobile-banner') ? 'active' : '' }}">
                <i class="nav-icon fas fa-clock"></i>
                <p> Mobile Banner</p>
                </a>
            </li>
            
            <li class="nav-item">
                <a href="{{ route('news.list') }}" class="nav-link {{ (request()->segment(2) == 'news') ? 'active' : '' }}">
                <i class="nav-icon fas fa-list"></i>
                <p> News</p>
                </a>
            </li>
            
            <li class="nav-item">
                <a href="{{ route('product.list') }}" class="nav-link {{ (request()->segment(2) == 'product') ? 'active' : '' }}">
                <i class="nav-icon fas fa-book"></i>
                <p> Products</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('delivery.area.list') }}" class="nav-link {{ (request()->segment(2) == 'delivery-area') ? 'active' : '' }}">
                <i class="nav-icon fas fa-map-marker"></i>
                <p> Delivery Area</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('delivery.slot.list') }}" class="nav-link {{ (request()->segment(2) == 'delivery-slot') ? 'active' : '' }}">
                <i class="nav-icon fas fa-list"></i>
                <p> Delivery Slot</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('promocode.list') }}" class="nav-link {{ (request()->segment(2) == 'promocode') ? 'active' : '' }}">
                <i class="nav-icon fas fa-circle"></i>
                <p> Promocode</p>
                </a>
            </li>

            <li class="nav-header">Orders</li>

            <li class="nav-item">
                <a href="{{ route('order.list') }}" class="nav-link {{ (request()->segment(2) == 'order'&& (request()->segment(3) != 'customer' && request()->segment(3) != 'summary')) ? 'active' : '' }}">
                <i class="nav-icon fas fa-newspaper"></i>
                <p> Orders Received</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('order.customers') }}" class="nav-link {{ (request()->segment(2) == 'order' && request()->segment(3) == 'customer') ? 'active' : '' }}">
                <i class="nav-icon fas fa-newspaper"></i>
                <p>Customer Orders</p>
                </a>
            </li>

            <li class="nav-item">
                <a href="{{ route('order.summary') }}" class="nav-link {{ (request()->segment(2) == 'order' && request()->segment(3) == 'summary') ? 'active' : '' }}">
                <i class="nav-icon fas fa-newspaper"></i>
                <p>Order Summary</p>
                </a>
            </li>
            
            <li class="nav-header">Reviews</li>

            <li class="nav-item">
                <a href="{{ route('review.list') }}" class="nav-link {{ (request()->segment(2) == 'review') ? 'active' : '' }}">
                <i class="nav-icon fas fa-star"></i>
                <p> Customer Reviews</p>
                </a>
            </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
