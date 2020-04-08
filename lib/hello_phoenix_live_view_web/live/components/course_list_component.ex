defmodule CourseListComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Course

  def mount(socket) do
    course_list = Course.list_course_list()
    IO.inspect(course_list, label: "course_list>>>>> ", pretty: true)
    socket =
      socket
      |> assign(:course_list, course_list)
      |> assign(:show_page, "course_list")
    {:ok, socket}
  end

  def render(assigns) do
    case assigns.show_page do
      "course_list" -> course_list_html(assigns)
      "add_course" -> add_course_html(assigns)
    end
  end


  def handle_event("add_course", params, socket) do
    IO.inspect(params, label: "888888>>>>>>", pretty: true)
    { :noreply, assign(socket, show_page: "add_course") }
  end

  def course_list_html(assigns) do
    IO.inspect(assigns, label: "99999>>>>>>", pretty: true)
    ~L"""
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Bordered Table</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <div class="col-md-2 col-sm-6 col-12">
                    <button phx-target="#add_course" id="add_course" phx-click="add_course" type="button" class="btn btn-block btn-success">新增课程</button>
                  </div>
                  <br/>
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 10px">ID</th>
                        <th>课程名称</th>
                        <th>课程价格</th>
                        <th>课时</th>
                        <th>简介</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%= for item <- @course_list do %>
                      <tr>
                        <td><%= item.id %></td>
                        <td><%= item.course_name %></td>
                        <td><%= item.price %></td>
                        <td><%= item.class_hour %></td>
                        <td><%= item.desc %></td>
                      </tr>
                      <%= end  %>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
                <div class="card-footer clearfix">
                  <ul class="pagination pagination-sm m-0 float-right">
                    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div>
              <!-- /.card -->
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>
    """
  end

  def add_course_html(assigns) do
    ~L"""
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-primary">
            <div class="card-body">
              <div class="form-group">
                <label for="inputName">Project Name</label>
                <input type="text" id="inputName" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputDescription">Project Description</label>
                <textarea id="inputDescription" class="form-control" rows="4"></textarea>
              </div>
              <div class="form-group">
                <label for="inputStatus">Status</label>
                <select class="form-control custom-select">
                  <option selected disabled>Select one</option>
                  <option>On Hold</option>
                  <option>Canceled</option>
                  <option>Success</option>
                </select>
              </div>
              <div class="form-group">
                <label for="inputClientCompany">Client Company</label>
                <input type="text" id="inputClientCompany" class="form-control">
              </div>
              <div class="form-group">
                <label for="inputProjectLeader">Project Leader</label>
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
    </section>
    """
  end

end
