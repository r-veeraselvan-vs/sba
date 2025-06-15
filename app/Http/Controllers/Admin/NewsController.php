<?php

namespace App\Http\Controllers\Admin;

use App\News;
use Brian2694\Toastr\Facades\Toastr;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    public function list()
    {
        $news = News::orderBy('display_order', 'asc')->get();

        return view('admin.news.news_list')->with([
            'news' => $news
        ]);
    }

    public function save(Request $request)
    {
        $new = new News();
        $new->news = $request->news;
        $new->url = $request->url;
        $new->display_order = $request->display_order;
        $new->status = $request->status;
        $new->save();

        Toastr::success('News Added');
        return redirect(route('news.list'));
    }
    
    public function edit($id)
    {
        $news = News::where('id', $id)->first();

        return view('admin.news.news_edit')->with([
            'news' => $news
        ]);
    }

    public function update(Request $request)
    {

        $old = News::find($request->id);
        $old->news = $request->news;
        $old->url = $request->url;
        $old->display_order = $request->display_order;
        $old->status = $request->status;
        $old->save();

        Toastr::success('News Updated');
        return redirect(route('news.list'));
    }
}
