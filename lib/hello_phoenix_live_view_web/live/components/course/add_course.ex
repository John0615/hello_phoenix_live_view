defmodule AddCourseComponent do
  use Phoenix.LiveComponent

  def mount(socket) do
    socket =
      socket
      |> assign(:show_page, "add_course")
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <div class="row" phx-hook="InfiniteScroll">
        <div class="col-md-12">
          <div class="card card-primary">
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">课程名称</label>
                <input type="text" id="inputName" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputDescription">课程简介</label>
                <textarea id="inputDescription" class="form-control" rows="4"></textarea>
              </div>
              <div class="form-group">
                <label for="inputStatus">课程类型</label>
                <select class="form-control custom-select">
                  <option selected disabled>请选择</option>
                  <option>一对一</option>
                  <option>小班</option>
                  <option>免费</option>
                </select>
              </div>
              <div class="form-group">
                <label for="inputClientCompany">课时</label>
                <input type="text" id="inputClientCompany" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputProjectLeader">课程级别</label>
                <input type="text" id="inputProjectLeader" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputProjectLeader">课程详情</label>
                <div id="editor">
                </div>
                <input type="hidden" id="inputProjectLeader" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputProjectLeader">课程单价</label>
                <input type="text" id="inputProjectLeader" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputProjectLeader">缩略图</label>
                <input type="text" id="inputProjectLeader" class="form-control">
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <a href="#" class="btn btn-secondary">Cancel</a>
          <input type="submit" value="Create new Porject" class="btn btn-success float-right">
        </div>
      </div>
    """
  end


end
