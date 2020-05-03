import E from 'wangeditor'

function init_edit() {
  // var E = window.wangEditor
  var editor = new E('#editor')
  // 编辑器的事件，每次改变会获取其html内容
  editor.customConfig.onchange = html => {
    console.log('html>>>>>>>', html)
    document.querySelector('#course_list_detail').value = html
  };
  editor.customConfig.menus = [
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
  editor.customConfig.uploadImgServer = '/upload'
  editor.create()
}

let wang_edit_hook = {
  mounted() {
    // init_edit()
  },
  updated() {
    // init_edit()
  }
}
export { wang_edit_hook }
