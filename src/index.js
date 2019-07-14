/* globals alert */
const ATAuth = {
  show() {
      alert("Module ATAuth is created sucessfully ")
  }
};


const meta = {
   ATAuth: [{
    lowerCamelCaseName: 'show',
    args: []
  }]
};

function init(weex) {
  weex.registerModule('ATAuth', ATAuth, meta);
}

export default {
  init:init
}