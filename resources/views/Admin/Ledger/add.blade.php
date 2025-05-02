

<div class="row"> 
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            
            @include('Admin.partial.livewire.X_titles')   

            <div class="x_content {{ $Collapse  }}">

                @if ($errors->any())
                    @foreach ($errors->all() as $key => $error)

                        <div class="col-mb-12 col-lg-12">
                            <div class="alert alert-danger" style="font-size: 13.5px;">
                                {{ $error }} !!!
                            </div>
                        </div>    
                    @endforeach
                @endif

                <div class="col-mb-12 col-lg-12">

                    <form wire:submit.prevent="saveLedger">

                        @csrf
                        <!-- =========================== title ========================== -->
                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $user_role_show }}" >
                            <div class="form-group" wire:ignore>
                                <label for="user_role">Select User Role</label>
                                <!-- <select class="form-control Select2DropDown" data-id="user_role" id="user_role" name="user_role"> -->
                                <select class="form-control Select2DropDown" data-id="user_role" id="user_role" name="user_role">
                                    <option value="">-- Select Role --</option>
                                        @foreach($roles as $role_id => $role_title)
                                            <option value="{{ $role_id }}">{{ $role_title }}</option>
                                        @endforeach 
                                </select>
                                <span class="error-container danger w-100"></span>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $payment_type_show }}" >
                            <div class="form-group" wire:ignore>
                                <label for="payment_type">Payment Type</label>
                                <select class="form-control Select2DropDown" data-id="payment_type" id="payment_type" name="payment_type">
                                    <option value="">-- Select Payment Type --</option>
                                    <option value="cash">Cash</option>
                                    <option value="product_sold">Product Sale</option>
                                    <option value="product_bought">Product Buy</option>
                                </select>
                                <span class="error-container danger w-100"></span>
                            </div>
                        </div>
                      
                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $show_users }}" >
                            <div class="form-group" wire:ignore>
                                <label>user <span class="danger">*</span></label>
                                <!-- <option value="">-- Select user --</option> -->
                                <select class="form-control Select2DropDown" data-id="user_id" id="user_id" name="user_id">
                                        @foreach($users as $user_id => $name)
                                            <option value="{{ $user_id }}">{{ $name }}</option>
                                        @endforeach 
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $show_items }}" >
                            <div class="form-group" wire:ignore>
                                <label>Item <span class="danger">*</span></label>
                                <select class="form-control Select2DropDown" data-id="item_id" id="item_id" name="item_id" >
                                    <option value="">-- Select Item --</option>
                                        @foreach($items as $item_id => $item_name)
                                            <option value="{{ $item_id }}">{{ $item_name }}</option>
                                        @endforeach 
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $cash_amount_show }}" >
                            <div class="form-group" id="cash_amount_section" >
                                <label for="cash_amount">Cash Amount</label>
                                <input type="number" class="form-control" wire:model='Ledger.cash_amount' id="cash_amount" name="amount" min="0" step="1" value="0">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $unit_price_show }}" >
                            <div class="form-group" id="unit_price_section" >
                                <label for="unit_price">Unit Price</label>
                                <input type="number" class="form-control" wire:model='Ledger.unit_price' {{ $unit_price_read_only }} id="unit_price" name="unit_price" min="0" step="1" value="0">
                                <span class="error-container danger w-100"></span>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $unit_qty_show }}" >
                            <div class="form-group" id="unit_qty_section" >
                                <label for="unit_qty">Unit Qty</label>
                                <input type="number" class="form-control" wire:model='Ledger.unit_qty' id="unit_qty" name="unit_qty" min="1" step="1">
                                <!-- <input type="number" class="form-control" id="unit_qty" name="unit_qty" step="0.01" value="0.0"> -->
                                <span class="error-container danger w-100"></span>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $total_amount_show }}" >
                            <div class="form-group" id="total_amount_section" >
                                <label for="total_amount" class="mt-2">Total Amount</label>
                                <input type="text" class="form-control" wire:model='Ledger.total_amount' id="total_amount" name="amount" min="0" step="1" readonly>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-6 col-xs-12 {{ $payment_detail_show }}" >
                            <div class="form-group">
                                <label for="details">Payment Details</label>
                                <textarea class="form-control" name="details" wire:model='Ledger.payment_detail' id="details" min="0" step="1"></textarea>
                                <span class="error-container danger w-100"></span>
                            </div>
                        </div>


                        <!-- <div class="mb-3 d-none" id="cashAmountSection">
                            <label for="cash_amount">Cash Amount</label>
                            <input type="number" class="form-control" id="cash_amount" name="amount" value="0.0" step="0.01">
                        </div> -->
                        
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary"> {{ $Ledger->id ? 'Update Ledger' : 'Save Ledger' }}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
