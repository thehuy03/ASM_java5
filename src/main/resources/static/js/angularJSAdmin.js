// start AngularJS
var app = angular.module("myApp", []);

app.controller("myCtrl", function ($scope) {
  // edit category
  $scope.editCate = function (id, name) {
    $scope.cate = {
      id: id,
      name: name,
    };
  };

  // edit spec
  $scope.editSpec = function (id, key, value) {
    $scope.spec = {
      id: id,
      key: key,
      value: value,
    };
  };

  // set role account
  $scope.account = {
    role: "true",
  };

  // edit account
  $scope.editAccount = function (phone, name, email, password, role) {
    $scope.account = {
      phone: phone,
      name: name,
      email: email,
      password: password,
      role: role,
    };
  };

  //edit producer
  $scope.editProducer = function (id, name, email, phone) {
    $scope.producer = {
      id: id,
      name: name,
      email: email,
      phone: phone,
    };
  };
});
// end AngularJS
//Load hinh
app.controller("myCtrlImage", function ($scope) {
  $scope.images = [];
  $scope.loadImages = function () {
    var files = $scope.selectedImages;
    $scope.images = []; // Xóa danh sách hình ảnh cũ
    for (var i = 0; i < files.length; i++) {
      var file = files[i];
      var reader = new FileReader();

      reader.onload = function (e) {
        var imageUrl = e.target.result;
        $scope.images.push(imageUrl);
        $scope.$apply();
      };
      console.log(files[i]);
      reader.readAsDataURL(file);
    }
  };
});
app.controller("myCtrlProduct", function ($scope, $http) {
  $scope.editProduct = function (id, name, price, quantity, producerId, categoryId) {
    var data = id
    $scope.product = {
      id: id,
      name: name,
      price: parseFloat(price),
      quantity: parseInt(quantity),
      producerId: producerId,
      categoryId: categoryId,
      abc:108,
    };
    console.log(data)
    $http.post('/admin/manager-product/listSpec/' + data)
      .then(function (response) {
        $scope.product.specs = response.data
        $scope.product.
        $scope.isSelectedSpec = function (specId) {
          console.log($scope.product.specs.includes(specId))
          return $scope.product.specs.includes(specId) ? true : false;
        };
      })
      .catch(function (error) {
        // Xử lý lỗi nếu có
        console.error(error);
      });
    $http.post('/admin/manager-product/listImg/' + data)
      .then(function (response) {
        // Nhận phản hồi từ backend controller
        $scope.product.images = response.data;
        console.log($scope.product.images)
      })
      .catch(function (error) {
        // Xử lý lỗi nếu có

      });
  }
})