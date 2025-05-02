<?php

namespace App\Http\Livewire\Admin\Ledger;

use Livewire\Component;
use App\Models\Admin\ItemCategory;
use App\Models\Admin\Item;
use App\Models\User;
use App\Models\Role;
use Livewire\WithPagination;
use Livewire\WithFileUploads;
use App\Traits\livewireComponentTraits\LedgerComponent;
    
class Index extends Component
{
    use WithPagination, WithFileUploads, LedgerComponent;

    protected $paginationTheme = 'bootstrap';

    protected $listeners = [
                            'deletetest' => 'deletetestRecord', 
                            'updateStatusOftest' => '', 
                            'selectedColumns' => 'export',
                            // 'CategoryOperation' => 'DeleteCategory'
                            'deleteCategoryOperation' => 'DeleteCategory',
                            'getItemAmount' => 'fetchItemAmount',
                            'UpdateFields' => 'HandleUpdateFields'
                        ];

    public function mount()
    {
        $this->setMountData();
        // dd('awdaw4444');
    }
    public function render()
    {

        $this->Collapse = $this->hasErrors() ? "uncollapse" : $this->Collapse;
        return view('livewire.admin.ledger.index', $this->RenderData());
    }
    public function fetchItemAmount($itemId)
    {
        // Fetch the selected item and its amount
        $item = Item::find($itemId);
        // dd($item);
        if ($item) 
        {
            $this->itemAmount = $item->cost_price;  // Assuming the `amount` column exists
        } 
        else 
        {
            $this->itemAmount = null;
        }
        $this->Collapse = 'uncollapse';

        $this->dispatchBrowserEvent('item_price', ['item_price' => $this->itemAmount]);
    }   

    public function saveLedger()
    {
        // if($this->selected_role_id != null)
        // {
        //     $this->Ledger->role_id = $this->selected_role_id;
        // }
        if($this->selected_user_id != null)
        {
            $this->Ledger->user_id = $this->selected_user_id;
        }
        if($this->selected_item_id != null)
        {
            $this->Ledger->item_id = $this->selected_item_id;
        }
        if($this->selected_payment_id != null)
        {
            $this->Ledger->payment_id = $this->selected_payment_id;
        }

        // dd($this->Ledger);


        $this->Ledger->save();
        $this->Ledger = new Ledger();
        $this->Collapse = 'collapse';

        if($this->Update)
        {
            $this->dispatchBrowserEvent('LedgerUpdated', ['message' => 'Category updated succesfullyy!!']);
        }

        // dd($this->Ledger);

    }
    public function HandleUpdateFields($data_id, $value)
    { 
        //dd($data_id, $value);
        // dd($data_id == 'payment_type', $data_id);    
        if($data_id == 'user_role')
        {
            $this->selected_role_id = $value;

            // if(empty($this->selected_role_id))
            // {
                $this->ResetData();
                $this->RenderData();
            // }

            $this->payment_type_show = '';
            $this->Collapse = 'uncollapse';
            // $this->dispatchBrowserEvent('LoadedUsers', ['users' => $users]);
        }
        else if($data_id == 'payment_type')
        {
            $this->selected_payment_id = $value;

            // show selected role users 
            if (in_array($this->selected_role_id, [12, 13, 14, 15]))  // 8 => "Manager" , // 12 => "Employee" // 13 => "Cashier" // 14 => "Customer" // 15 => "Vendor"
            {
                $users = User::whereHas('roles', function ($query) {
                    $query->where('id', $this->selected_role_id);
                })->pluck('name', 'id');
            }
            
            if($this->selected_payment_id == 'cash')
            {
                $this->cash_amount_show = '';
                $this->total_amount_show = '';   
            }
            else if($this->selected_payment_id == 'product_sold')
            {
                $items = Item::pluck('name', 'id');

                $users = User::whereHas('roles', function ($query) {
                    $query->where('id', $this->selected_role_id);
                })->pluck('name', 'id');
            }
            else if($this->selected_payment_id == 'product_bought')
            {
                if($this->selected_role_id == 15) // from vendor role we can bought only
                {
                    $items = Item::where('category_id', 12)->pluck('name', 'id');
                }
                else
                {
                    $this->dispatchBrowserEvent('item_error', ['message' => 'We Can buy only from vendors']);
                    return false;
                }
            }

            $this->show_users = '';
            $this->Collapse = 'uncollapse';
            $this->dispatchBrowserEvent('LoadedUsers', ['users' => $users]);    

            if($this->selected_payment_id == 'product_sold' || $this->selected_payment_id == 'product_bought')
            {
                $this->show_items = '';
                $this->show_items = '';
                $this->unit_price_show = '';
                $this->unit_price_read_only = 'readonly';
                $this->unit_qty_show = '';
                $this->total_amount_show = '';
                $this->dispatchBrowserEvent('LoadedItems', ['items' => $items]);
            }

            // $this->payment_type_show = '';
            // dd($this->selected_payment_id);
            // dd('seleceted payment_type ', $value);
            
        }
        else if($data_id == 'user_id')
        {
            $this->selected_user_id = $value;
            // dd('seleceted user_id ', $value);

        }
        else if($data_id == 'item_id')
        {
            $this->selected_item_id = $value;
            $selected_item = Item::find($this->selected_item_id);
            $this->Ledger->unit_price = $selected_item->price;
            $this->Ledger->unit_qty = 1;
            $this->Ledger->total_amount = $this->Ledger->unit_price * $this->Ledger->unit_qty;
        }
    }
    public function ResetDataForCash()
    {
        //add d-none reset user
        //add d-none reset item
        //add d-none reset unit price
        //add d-none reset unit qty
        //add d-none reset unit total amount

        $this->payment_type_show = 'd-none';
        $this->show_users = 'd-none';
        $this->show_items = 'd-none';
        $this->cash_amount_show = 'd-none';
        $this->unit_price_show = 'd-none';
        $this->unit_qty_show = 'd-none';
        $this->total_amount_show = 'd-none';
        $this->payment_detail_show = 'd-none';

        $this->selected_item_id = null;
        $this->selected_role_id = null;
        $this->selected_user_id = null;
        $this->selected_payment_id = null;

        $this->unit_price_read_only = '';
        
        $this->Ledger->cash_amount = null;
        $this->Ledger->unit_price = null;
        $this->Ledger->unit_qty = null;
        $this->Ledger->total_amount = null;
        $this->Ledger->payment_detail = null;
    }
    public function ResetData()
    {
        $this->payment_type_show = 'd-none';
        $this->show_users = 'd-none';
        $this->show_items = 'd-none';
        $this->cash_amount_show = 'd-none';
        $this->unit_price_show = 'd-none';
        $this->unit_qty_show = 'd-none';
        $this->total_amount_show = 'd-none';
        $this->payment_detail_show = 'd-none';

        $this->selected_item_id = null;
        $this->selected_role_id = null;
        $this->selected_user_id = null;
        $this->selected_payment_id = null;

        $this->unit_price_read_only = '';
        
        $this->Ledger->cash_amount = null;
        $this->Ledger->unit_price = null;
        $this->Ledger->unit_qty = null;
        $this->Ledger->total_amount = null;
        $this->Ledger->payment_detail = null;
        
    }
}