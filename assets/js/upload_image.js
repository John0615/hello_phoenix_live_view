
/**
 * ==============================
 * 上传组件
 * ==============================
 */
// function adminUpload(option = {}, className) {
//     let defaults = {
//       // 上传地址
//       url: 'UploadImg/Upload.php?save_path=images',
//       checkClass: 'checked'
//     }
//   let options = Object.assign(defaults, option)
//   let obj = document.querySelector(`.${className}`)
//   console.log('obj>>>',obj)
//   obj.classList.contains('add-picture-box') || obj.classList.add('add-picture-box')
// };




let uploadImage = {

  mounted() {
    document.querySelector('.input_flie').addEventListener('change', function () {
      var filesList = document.querySelector('.input_flie').files;
      console.log('lllllllllllll', filesList)
    });
  }
}
export { uploadImage }
