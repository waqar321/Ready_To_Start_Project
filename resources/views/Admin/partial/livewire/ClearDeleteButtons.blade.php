<div  class="col-md-3 col-lg-3">
        <button type="button" wire:click="resetInput(true)" class="btn btn-danger SearchButton">
            Clear  
            <i class="fa fa-search"></i>
        </button>
        @if($showDeleteButton == 'true')
            <button type="button" wire:click="deleteSelected('{{ $modelName }}')" class="btn btn-danger SearchButton">
                Delete Selected 
                <i class="fa fa-trash"></i>
            </button>                    
        @endif 
</div>
