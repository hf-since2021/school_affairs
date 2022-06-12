// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
// このファイルは、このディレクトリに存在する他のファイルとともに、Webpackによって自動的にコンパイルされます。
// 実際のアプリケーションロジックはapp/javascript内の適切な構造体に配置し、これらのpackファイルはそのコード
// を参照するためにのみ使用し、コンパイルされることをお勧めします。(DeepL)

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// @import "~bootstrap/scss/bootstrap.scss";
import "bootstrap"
import "../stylesheets/application"

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
