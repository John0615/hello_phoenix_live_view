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
                <div id="wangeditor">
                  <div ref="editorElem" style="text-align:left;"></div>
                </div>
                <input type="text" id="inputProjectLeader" class="form-control">
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
      <script>
        function aa () {
          var E = window.wangEditor
          var editor = new E('#editor')
          editor.create()
          this.editor = new E(this.$refs.editorElem);
          // 编辑器的事件，每次改变会获取其html内容
          this.editor.customConfig.onchange = html => {
            this.editorContent = html;
            this.catchData(this.editorContent); // 把这个html通过catchData的方法传入父组件
          };
          this.editor.customConfig.menus = [
            // 菜单配置
            'head', // 标题
            'bold', // 粗体
            'fontSize', // 字号
            'fontName', // 字体
            'italic', // 斜体
            'underline', // 下划线
            'strikeThrough', // 删除线
            'foreColor', // 文字颜色
            'backColor', // 背景颜色
            'link', // 插入链接
            'list', // 列表
            'justify', // 对齐方式
            'quote', // 引用
            'emoticon', // 表情
            'image', // 插入图片
            'table', // 表格
            'code', // 插入代码
            'undo', // 撤销
            'redo' // 重复
          ];
          this.editor.create(); // 创建富文本实例
        }
        aa()
      </script>
    """
  end


end
