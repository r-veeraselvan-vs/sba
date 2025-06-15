 <!-- Denomination form will be displayed here -->
 @if($denomination_1!=0)
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-1">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-1" name="amount[0]" value="1" readonly>
                          </div>
                        </div>
<div class="col-md-6">
    <label for="denomination-1">Enter Denominations</label>
    <input type="text" class="form-control Debitdenominations" id="debit-denomination-1" min="1" max="{{$denomination_1}}" name="denomination_1" value="{{ old('denomination_1')}}"    onkeypress="return /[0-9]/i.test(event.key)"  >
</div>

                    </div>
                    @endif
                    @if($denomination_2!=0)
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-2">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-2" name="amount[1]" value="2" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-2">Enter Denominations</label>
                        <input type="text" class="form-control Debitdenominations" id="debit-denomination-2" min="1" max="{{$denomination_2}}" name="denomination_2" value="{{ old('denomination_2')}}"  onkeypress="return /[0-9]/i.test(event.key)" >
                        </div>
                    </div>
                    @endif
                     @if($denomination_5!=0)
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-5">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-5" name="amount[2]" value="5" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-5">Enter Denominations</label>
                        <input type="text" class="form-control Debitdenominations" id="debit-denomination-5" min="1" max="{{$denomination_5}}" name="denomination_5" value="{{ old('denomination_5')}}"  onkeypress="return /[0-9]/i.test(event.key)" >
                        </div>
                    </div>
                    @endif
                    @if($denomination_10!=0)
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-10">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-10" name="amount[3]" value="10" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-10">Enter Denominations</label>
                        <input type="text" class="form-control Debitdenominations" id="debit-denomination-10" min="1" max="{{$denomination_10}}" name="denomination_10" value="{{ old('denomination_10')}}"  onkeypress="return /[0-9]/i.test(event.key)" >
                        </div>
                    </div>
                    @endif
                    @if($denomination_20!=0)
                      <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-20">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-20" name="amount[4]" value="20" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-20">Enter Denominations</label>
                        <input type="text" class="form-control Debitdenominations" id="debit-denomination-20" min="1" max="{{$denomination_20}}" name="denomination_20" onkeypress="return /[0-9]/i.test(event.key)" value="{{ old('denomination_20')}}">
                        </div>
                    </div>
                    @endif
                    @if($denomination_50!=0)
                       <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-50">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-50" name="amount[5]" value="50" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-50">Enter Denominations</label>
                        <input type="text" class="form-control Debitdenominations" id="debit-denomination-50" min="1" max="{{$denomination_50}}" name="denomination_50"  onkeypress="return /[0-9]/i.test(event.key)" value="{{ old('denomination_50')}}">
                        </div>
                    </div>
                    @endif
                    @if($denomination_100!=0)
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-100">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-100" name="amount[6]" value="100" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-100">Enter Denominations</label>
                        <input type="text" class="form-control Debitdenominations" id="debit-denomination-100" min="1" max="{{$denomination_100}}"  name="denomination_100"  onkeypress="return /[0-9]/i.test(event.key)" value="{{ old('denomination_100')}}">
                        </div>
                    </div>
                    @endif
                    @if($denomination_200!=0)
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-200">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-200" name="amount[7]" value="200" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-200">Enter Denominations</label>
                        <input type="text" class="form-control Debitdenominations" id="debit-denomination-200" min="1" max="{{$denomination_200}}"  name="denomination_200" @if($denomination_200 <= "9") onkeypress="return /[0-{{$denomination_200}}]/i.test(event.key)" @else onkeypress="return /[0-9]/i.test(event.key)"   @endif value="{{ old('denomination_200')}}">
                        </div>
                    </div>
                    @endif
                    @if($denomination_500!=0)
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                            <label for="denomination-500">Amount</label>
                            <input type="text" class="form-control DebitdenominationsAmount" id="debit-amount-500" name="amount[8]" value="500" readonly>
                          </div>
                        </div>
                         <div class="col-md-6">
                            <label for="denomination-500">Enter Denominations</label>
                        <input type="text" class="form-control Debitdenominations" id="debit-denomination-500"  min="1" max="{{$denomination_500}}" name="denomination_500"  onkeypress="return /[0-9]/i.test(event.key)" value="{{ old('denomination_500')}}">
                        </div>
                    </div>
                    @endif
                  
                       
                      <button type="button" onclick="checkDenominations()" class="btn btn-primary">Add</button>