

var app=angular.module("app",[]);
app.controller('entidadBancariaCtrl', function($scope, $http){
    $scope.entidad=null;
    $scope.entidadesBancarias = [];
   
    $scope.readEntidad = function() {
        $http.get("http://localhost:8084/daiwal/entidadBancaria.json.jsp").success(function(result) {
           $scope.entidad=result;
        })
    }
    $scope.readEntidades=function(){
        $http.get("http://localhost:8084/daiwal/EntidadesBancarias.json.jsp").success(function(result) {
            $scope.entidadesBancarias=result;
        });
    }
    
});