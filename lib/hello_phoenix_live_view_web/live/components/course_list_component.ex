defmodule CourseListComponent do
  use Phoenix.LiveComponent
  alias HelloPhoenixLiveView.Course

  def mount(socket) do
    course_list = Course.list_course_list()
    IO.inspect(course_list, label: "course_list>>>>> ", pretty: true)
    socket =
      socket
      |> assign(:course_list, course_list)
    {:ok, socket}
  end

  def render(assigns) do
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
                  <div class="col-md-1 col-sm-6 col-12">
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


  def handle_event("add_course", params, socket) do
    IO.inspect(params, label: "888888>>>>>>", pretty: true)
    { :noreply, socket }
  end

end
