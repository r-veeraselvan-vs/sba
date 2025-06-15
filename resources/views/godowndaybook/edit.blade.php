@extends('layouts.app')

@section('content')
<style type="text/css">
    input:invalid
{
  border: 2px solid pink;
}
</style>
<div style="margin-top:3rem">
<div class="row justify-content-center">
    @if (session('success'))
    <div class="alert alert-success alert-dismissible show" role="alert">
        <strong>{{ session('success') }}</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
</div>
</div>
<div style="margin-top:1rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Edit Godown Day Book</h4>
                    <?php 
                        $total = session('total');
                    ?>
                    <p>Total: {{ $total }}</p>
                  </div>
                  <div class="panel-body">
        <form method="POST" action="{{ route('godown.update', $daybook->id) }}">
            @csrf
            @method('POST')
            
            <div class="form-group row">
                <label for="date" class="col-md-4 col-form-label text-md-right">{{ __('Date') }}</label>

                <div class="col-md-6">
                    <input id="date" type="date" class="form-control @error('date') is-invalid @enderror" name="date" value="{{ $daybook->date }}" onchange="DateChange(this.value)"  required>

                    @error('date')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
            </div>

            <div class="form-group row">
                <label for="heading_id" class="col-md-4 col-form-label text-md-right">{{ __('Heading') }}</label>
                <div class="col-md-6">
                <select name="heading_id" id="heading_id" class="form-control" onchange="loadSubcategory(this.value)"  required>
                    <option value="">Select a Heading</option>
                    @foreach ($headings as $heading)
                        @if($heading->status == 'active')
                            <option value="{{ $heading->id }}" {{ $heading->id == $daybook->heading_id ? 'selected' : '' }}>{{ $heading->name }}</option>
                        @endif
                    @endforeach
                </select>
                </div>
            </div>

            <div class="form-group row">
                <label for="subheading_id" class="col-md-4 col-form-label text-md-right">{{ __('SubHeading') }}</label>
                <div class="col-md-6">
                <select name="subheading_id" id="subheading_id" class="form-control">
                    <option value="">Select a SubHeading</option>
                    
                </select>
                </div>
            </div>

            <div class="form-group row">
                <label for="description_1" class="col-md-4 col-form-label text-md-right">{{ __('Description 1') }}</label>

                <div class="col-md-6">
                    <textarea id="description_1" rows="2" cols="50" type="text" name="description_1" autofocus="autofocus" class="form-control @error('description_1') is-invalid @enderror" value="{{ old('description_1') }}" autocomplete="description_1">{{ $daybook -> description_1 }}</textarea>
                    @error('description_1')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>

            <div class="form-group row">
                <label for="description_2" class="col-md-4 col-form-label text-md-right">{{ __('Description 2') }}</label>

                <div class="col-md-6">
                    <textarea id="description_2" rows="2" cols="50" type="text" name="description_2" autofocus="autofocus" class="form-control @error('description_2') is-invalid @enderror" value="{{ old('description_2') }}" autocomplete="description_2">{{ $daybook -> description_2 }}</textarea>

                    @error('description_2')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>
<div class="form-group row">
                            <label for="description_2" class="col-md-4 col-form-label text-md-right">{{ __('Payment Mode') }}</label>

                            <div class="col-md-6">
                               <div class="form-group row">
                                 <div class="col-md-3">
        <input type="radio" name="payment_mode" value="cash"  @if($daybook -> payment_mode=="cash") checked @endif onclick ="enableDenominations()" required>
        <label for="debit">Cash</label>
    </div>
    <div class="col-md-3">
        <input type="radio" name="payment_mode" value="online"  @if($daybook -> payment_mode=="online") checked @endif onclick ="enableDenominations()" required>
        <label for="credit">Online</label>
    </div>
   </div>
   </div></div>
             <div class="form-group row">
                            <div class="col-md-2">
                                <input type="radio" name="type" value="C" required {{ "C" == $daybook->type ? 'checked' : '' }}  style="cursor:not-allowed" onclick="javascript: return false;">
                                <label for="credit">Credit</label>
                            </div>
                            <div class="col-md-2">
                                <input type="radio" name="type" value="D"   required {{ "D" == $daybook->type ? 'checked' : '' }}  style="cursor:not-allowed" onclick="javascript: return false;">
                                <label for="debit">Debit</label>
                            </div>
                            <div class="col-md-6" id="credit">
                                <label for="credit">Amount:</label>
                                <input class="form-control" type="text" name="total_amount"  oninput="checkAmount()"  id="amount_id" min="0" step="0.01" required onkeypress="return /[0-9.]/i.test(event.key)" value="{{ $daybook->amount }}">
        <span id="totalAmountError" style="color: red;"></span>
                            </div>
                           
                        </div>
            



            
            <div class="form-group text-center" id="credit_denominations" style="display: none;">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#creditDenominationModal"  data-backdrop="static" data-keyboard="false">Select Denomination</button>
            </div>
            
            <!-- Modal -->
           <!-- Modal -->
            <div class="modal fade" id="creditDenominationModal"  role="dialog" >
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="creditDenominationModalLabel">Select Denomination<button type="button" class="close" data-dismiss="modal" id="closeLink" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button></h5>
                  </div>
                  <div class="modal-body">
                    <!-- Denomination form will be displayed here -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-1">Amount</label>
                            <input type="number" class="form-control denominationsAmount" id="amount-1" name="amount[0]" value="1" readonly>
                          </div>
                        </div>
                            <div class="col-md-6">
                                <label for="denomination-1">Enter Denominations</label>
                                <input type="text" class="form-control denominations" id="denomination-1"  name="denomination_1" value="{{ $denominationTotal->sum('denomination_1')}}"  onkeypress="return /[0-9,-]/i.test(event.key)" >
                                @if($denomination_1>0)
                                 <small id="emailHelp" class="form-text text-danger available_denominations">Available denominations :  {{$denomination_1}}</small>
                                 @else
                                    <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                                 @endif
                            </div>
                               
 
                    </div>
                    <div class="row " style="margin-top:13px">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-2" name="amount[1]" value="2" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="text" class="form-control denominations" id="denomination-2"  name="denomination_2" value="{{ $denominationTotal->sum('denomination_2')}}"  onkeypress="return /[0-9,-]/i.test(event.key)" >
                         @if($denomination_2>0)
                                 <small id="emailHelp" class="form-text text-danger  available_denominations">Available denominations :  {{$denomination_2}}</small>
                                 @else
                                    <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                                 @endif
                        </div>
                    </div>
                    <div class="row"  style="margin-top:13px">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-5" name="amount[2]" value="5" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="text" class="form-control denominations" id="denomination-5"  name="denomination_5" value="{{ $denominationTotal->sum('denomination_5')}}"  onkeypress="return /[0-9,-]/i.test(event.key)" >
                         @if($denomination_5>0)
                                 <small id="emailHelp" class="form-text text-danger  available_denominations">Available denominations :  {{$denomination_5}}</small>
                                 @else
                                    <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                                 @endif
                        </div>
                    </div>
                    <div class="row" style="margin-top:13px">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-10" name="amount[3]" value="10" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="text" class="form-control denominations" id="denomination-10"  name="denomination_10" value="{{$denominationTotal->sum('denomination_10')}}"  onkeypress="return /[0-9,-]/i.test(event.key)" >
                         @if($denomination_10>0)
                                 <small id="emailHelp" class="form-text text-danger  available_denominations">Available denominations :  {{$denomination_10}}</small>
                                 @else
                                    <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                                 @endif
                        </div>
                    </div>
                      <div class="row" style="margin-top:13px">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-20" name="amount[4]" value="20" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="text" class="form-control denominations" id="denomination-20"  name="denomination_20" onkeypress="return /[0-9,-]/i.test(event.key)" value="{{$denominationTotal->sum('denomination_20')}}">
                         @if($denomination_20>0)
                                 <small id="emailHelp" class="form-text text-danger  available_denominations">Available denominations  : {{$denomination_20}}</small>
                                 @else
                                    <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                                 @endif
                        </div>
                    </div>
                       <div class="row" style="margin-top:13px">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-50" name="amount[5]" value="50" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="text" class="form-control denominations" id="denomination-50"  name="denomination_50"  onkeypress="return /[0-9,-]/i.test(event.key)" value="{{$denominationTotal->sum('denomination_50')}}">
                         @if($denomination_50>0)
                                <small id="emailHelp" class="form-text text-danger  available_denominations">Available denominations : {{$denomination_50}}</small>
                        @else
                                <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                        @endif
                        </div>
                    </div>
                    <div class="row" style="margin-top:13px">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-100" name="amount[6]" value="100" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="text" class="form-control denominations" id="denomination-100"   name="denomination_100"  onkeypress="return /[0-9,-]/i.test(event.key)" value="{{$denominationTotal->sum('denomination_100')}}">
                         @if($denomination_100>0)
                                <small id="emailHelp" class="form-text text-danger  available_denominations">Available denominations  : {{$denomination_100}}</small>
                        @else
                                <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                        @endif
                        </div>
                    </div>
                    <div class="row" style="margin-top:13px">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-200" name="amount[7]" value="200" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="text" class="form-control denominations" id="denomination-200"   name="denomination_200"  onkeypress="return /[0-9,-]/i.test(event.key)" value="{{$denominationTotal->sum('denomination_200')}}">
                        @if($denomination_200>0)
                                <small id="emailHelp" class="form-text text-danger  available_denominations">Available denominations  : {{$denomination_200}}</small>
                        @else
                                <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                        @endif
                        </div>
                    </div>
                    <div class="row" style="margin-top:13px">
                        <div class="col-md-6">
                            <div class="form-group">
                             <input type="number" class="form-control denominationsAmount" id="amount-500" name="amount[8]" value="500" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                         <input type="text" class="form-control denominations" id="denomination-500"   name="denomination_500"  onkeypress="return /[0-9,-]/i.test(event.key)" value="{{$denominationTotal->sum('denomination_500') }}">
                         @if($denomination_500>0)
                                <small id="emailHelp" class="form-text text-danger  available_denominations">Available denominations  : {{$denomination_500}}</small>
                        @else
                                <small id="emailHelp" class="form-text text-danger   available_denominations">Denominations not available</small>
                        @endif
                        </div>
                    </div>
                
                       
                      <button type="button" onclick="checkDenominations()" class="btn btn-primary">Add</button>
                   </div>
                    
                </div>
              </div>
            </div>
  




            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary" id="submit_button">Update</button>
            </div>

        </form>
    </div>
    </div>
</div>
</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>

    function checkAmount() {
        const amountInput = document.getElementById('amount_id');
        const amount = parseFloat(amountInput.value);
        const type = document.querySelector('input[name="type"]:checked').value;
        const total = {{ $total }};
        const totalAmountError = document.getElementById('totalAmountError');

        // Clear any previous error message
        totalAmountError.textContent = '';

        // Check the conditions and show an error if necessary
        if ( amount > total && type === 'D') {
             amountInput.value='';
            totalAmountError.textContent = 'Debited amount cannot be greater than Total: ' + total;
            document.getElementById('submit_button').disabled = true;
         } else {
            document.getElementById('submit_button').disabled = false;
         }
    }
</script>

  <script>
 
    function loadSubcategory(){
        $('#subheading_id').empty();
        var heading_id = $('#heading_id').val();
         var subCatArr = @json($subheading);
        var filteredArray = subCatArr.filter(x => x.heading_id == heading_id);
         $('#subheading_id').append('<option value="">Select Sub Heading</option>');
        var options = filteredArray.forEach( function(item, index){
            $('#subheading_id').append('<option value="'+item.id+'">'+item.name+'</option>');
        });
       
    }

   function checkDenominations() {
      var total = 0;
      var DebitTotal = 0;
       var denominations = [1, 2, 5, 10, 20, 50, 100, 200, 500, 2000];
        Array.from(document.getElementsByClassName("denominationsAmount")).forEach(function(element, index, array) {
                var amount = element.value;
                
               
                var countElem = document.getElementsByClassName('denominations')[index];
                var available_denominations = document.getElementsByClassName('available_denominations')[index];
 
                     if (countElem) { // add a check to make sure the element exists
                      var count = countElem.value;
                         if(Math.sign(count)>=0)
                        {
                          var denomination = denominations[index];
                          total += count * denomination;
                        }
                        
                        if(Math.sign(count)<0 && available_denominations!=undefined)
                        {
                             const myArray = available_denominations.innerText.split(":"); 
                             if(myArray.length>=2)
                            {
                                if(myArray[1].trim()!="")
                                {
 
                                    var denomination1 = denominations[index];
                                    DebitTotal += count * denomination1;
                                }
                                else
                                {
                                    countElem.value ="";
                                     DebitTotal = DebitTotal;
                                } 
                            }
                             else
                                {
                                    countElem.value ="";
                                     DebitTotal = DebitTotal;
                                 } 
                           
                            
                        } 
                }
                
              });
              console.log(total,DebitTotal);
               const checktype = document.querySelector('input[name="type"]:checked').value;
        if(checktype=="C" && total==0)
        {
             console.log(checktype,"C");
            alert("Must enter valid denominations");
            return false;
        }
        else if(checktype=="D" && DebitTotal==0)
        {
            console.log(checktype,"D");
            alert("Must enter valid denominations");
            return false;
        }
        else
        {
         var overall_total = total + DebitTotal;
         console.log(overall_total,"overall_total");
        function getPositive(number) {
         // if number is less than zero multiply with -1, otherwise returns as it is
         return number < 0 ? number * -1 : number;
      }
      
         
         console.log(getPositive(overall_total),"overall_total");
        var amounttotal = document.getElementById('amount_id').value;
               if (amounttotal != getPositive(overall_total)) {
                alert("Must enter valid denominations");
                 return false;
              } else {
                alert("Added Successfully");
                var link = document.getElementById('closeLink');
                link.click();
                 return true;
              }   
        }
       
    }
    window.onload = enableDenominations();
    
    function enableDenominations()
    {
         const payment_mode = document.querySelector('input[name="payment_mode"]:checked').value;
         if(payment_mode=="cash")
        {
             
                     document.getElementById('credit_denominations').style.display="block";

                
            }
            else
            {
                document.getElementById('credit_denominations').style.display="none";
             }

    }

     function validateForm() {
        const payment_mode = document.querySelector('input[name="payment_mode"]:checked').value;
        var total = 0;
      var DebitTotal = 0;
        if(payment_mode=="cash")
        {
            var denominations = [1, 2, 5, 10, 20, 50, 100, 200, 500, 2000];
            Array.from(document.getElementsByClassName("denominationsAmount")).forEach(function(element, index, array) {
                var amount = element.value;
                
               
                var countElem = document.getElementsByClassName('denominations')[index];
                var available_denominations = document.getElementsByClassName('available_denominations')[index];
 
                     if (countElem) { // add a check to make sure the element exists
                      var count = countElem.value;
                         if(Math.sign(count)>=0)
                        {
                          var denomination = denominations[index];
                          total += count * denomination;
                        }
                        
                        if(Math.sign(count)<0 && available_denominations!=undefined)
                        {
                             const myArray = available_denominations.innerText.split(":"); 
                             if(myArray.length>=2)
                            {
                                if(myArray[1].trim()!="")
                                {
 
                                    var denomination1 = denominations[index];
                                    DebitTotal += count * denomination1;
                                }
                                else
                                {
                                    countElem.value ="";
                                     DebitTotal = DebitTotal;
                                } 
                            }
                             else
                                {
                                    countElem.value ="";
                                     DebitTotal = DebitTotal;
                                 } 
                           
                            
                        } 
                }
                
              });
               const checktype = document.querySelector('input[name="type"]:checked').value;
        if(checktype=="C" && total==0)
        {
            alert("Must enter valid denominations");
            return false;
        }
        else if(checktype=="D" && DebitTotal==0)
        {
            alert("Must enter valid denominations");
            return false;
        }
        else
        {
            var overall_total = total + DebitTotal;
            function getPositive(number) {
         // if number is less than zero multiply with -1, otherwise returns as it is
         return number < 0 ? number * -1 : number;
      }
      
         
         console.log(getPositive(overall_total),"overall_total");
        var amounttotal = document.getElementById('amount_id').value;
               if (amounttotal != getPositive(overall_total)) {
                alert("Must enter valid denominations");
                 return false;
              } else {
                alert("Added Successfully");
                var link = document.getElementById('closeLink');
                link.click();
                 return true;
              }    
           
             
                

        }
        }
        else
        {
            return true;
        }
          
         
     }

      function DateChange(value)
    {
        var url = '{{ route("godown.filter") }}';
        $.ajax({
          type : 'get',
          url : url,
          data : {'date':value,"page":"edit"},
          success:function(data){
                console.log(data);
                $('#debit_denomination_filter').empty();
                $('#debit_denomination_filter').html(data['records']);
            } 
       });
    }


  </script>
@endsection