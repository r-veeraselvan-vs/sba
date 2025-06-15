<?php

namespace App\Http\Controllers\Admin;

use Brian2694\Toastr\Facades\Toastr;
use App\Http\Controllers\Controller;
use App\User;
use Hash;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function addUser()
    {
        return view('admin.user.add_user');
    }

    public function saveUser(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'mobile' => 'required|integer',
            'email' => 'required|email|unique:users',
            'password' => 'required',
            'role' => 'required'
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->mobile = $request->mobile;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->role = $request->role;
        $user->save();

        Toastr::success('User Created');
        return redirect(route('user.list'));
    }

    public function listUser()
    {
        $users = User::orderBy('id', 'DESC')->where('role', '!=', 'User')->get();
        return view('admin.user.list_user')->with([
            'users' => $users
        ]);
    }

    public function editUser($userId)
    {
        $user = User::where('id', $userId)->first();
        return view('admin.user.edit_user')->with([
            'user' => $user
        ]);
    }

    public function updateUser(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'mobile' => 'required|integer',
            'email' => 'email|required|unique:users,email,'.$request->id,
            'role' => 'required',
            'status' => 'required'
        ]);
        User::where('id', $request->id)->update([            
            'name'      => $request->name,
            'mobile'    => $request->mobile,
            'email'     => $request->email,
            'role'      => $request->role,
            'status'    => $request->status,
        ]);

        Toastr::success('User Updated');
        return redirect(route('user.list'));
    }
}
