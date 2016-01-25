var fake = angular.module('fake', ['infinite-scroll']);

angular.module('fake').controller('PostsCtrl', ["$http", function($http){
  var self = this;

  self.page = 1;
  self.busy = false;
  self.has_more = true;

  self.params = {};

  self.load = function() {
    self.busy = true;
    if(self.has_more) {
      self.call();
    }
  };

  self.call = function() {
    $http({
      method: 'GET',
      url: '/home/page',
      params: {
        page: self.page,
        upcoming: self.upcoming,
        recents: self.recent
      }
    }).success(function(data) {
      $('#feed').append(data);
      self.set_has_more(data);
      self.busy = false;
    });
  };


  self.set_has_more = function(data) {
    if(data) {
      self.has_more = true;
    } else {
      self.has_more = false;
    }
  };


  self.scroll = function() {
    self.page += 1;
    self.load();
  };

}]);