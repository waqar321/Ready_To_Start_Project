@push('styles')
    <style>
        .nav 
        {
            /* flex-wrap: nowrap  !important; */
        }
    </style>

@endpush 


<!-- top navigation -->
<div class="top_nav sticky-top">
    <div class="nav_menu">
        <div style="position: absolute; padding: 10px 0 10px 0px; font-size: 24px; left:60px"><b>NAME </b>Name</div>
        <div class="nav toggle">
            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
        </div>
        <nav class="nav navbar-nav">
            <ul class=" navbar-right">
                <li class="nav-item dropdown open" style="padding-left: 15px;">
                    <a href="javascript:void(0)" class="user-profile" id="loadingBarGif" style="display:none;">
                        <img src="{{ url_secure('build/images/logo/loadingBar1.gif') }}" alt="" >
                    </a>
                    <a href="javascript:void(0)" id="broomButton" class="user-profile " >
                        <img src="{{ url_secure('build/images/broom.png') }}" alt="" style="filter: invert(100%);">
                    </a>
                </li>
                <li class="nav-item dropdown open" style="padding-left: 15px;">

                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                        <img src="{{ url_secure('images/img.jpg') }}" alt="">{{ auth()->user()->full_name }}
                    </a>
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item"  href="{{ url_secure('change-password') }}"> Change Password</a>
                        <a class="dropdown-item"  href="{{ url_secure('logout') }}"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                    </div>
                </li>

  
                <!-- =================================================================== -->


                <!-- =================================================================== -->
                <!-- <div wire:ignore.self > -->

                    <li class="nav-item dropdown open">

                        <!-- <div> -->
                           
                        <!-- </div> -->
                    </li>
                    
                </div>
                <!-- =================================================================== -->
                    
                                    

            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->

@push('scripts')
    <script>
        const giff_url = "{{ url_secure('build/images/transpatent_leopard.gif') }}";
        var sweepUrl = '<?php echo url_secure('/generalSweepUp'); ?>';
    </script>
    <script src="{{ url_secure('build/js/sweep.js')}}"></script>
@endpush 