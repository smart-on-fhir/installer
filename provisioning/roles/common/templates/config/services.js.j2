angular.module('fhirStarter').factory('fhirSettings', function($rootScope, oauth2, $q) {

  var servers = [
    {
      name: '{{fhir_server_name}}',
      serviceUrl: '{{fhir_server_base}}'
    }, {
      name: "SMART on FHIR (smarthealthit.org), no auth",
      serviceUrl: "https://fhir-open-api-dstu2.smarthealthit.org"
    }, {
      name: 'Health Intersections Server (Grahame)',
      serviceUrl: 'https://fhir.healthintersections.com.au/open'
    }, {
      name: 'Furore Server (Ewout)',
      serviceUrl: 'https://spark.furore.com/fhir'
    }
  ];
  
  function decorateWithType (settings) {
  
    var deferred = $q.defer();
    
    FHIR.oauth2.resolveAuthType(settings.serviceUrl, function (type) {
      
        // override the security type with the one resolved via introspection
        // of the conformance statement
        settings.auth = {
            type: type
        };

        deferred.resolve (settings);

    }, function (err) {
        $rootScope.$emit('error', err);
        deferred.reject('Error resolving service type');
    });
    
    return deferred.promise;
  }
  
  function loadSettings () {
        var deferred = $q.defer();
            if (settings.auth && settings.auth.type) {
                deferred.resolve ();
            } else {
                decorateWithType(settings).then(
                    function() {
                        deferred.resolve();
                    }, function() {
                        deferred.reject()
                    });
            }
        return deferred.promise;
  }

  var settings = localStorage.fhirSettings ? 
  JSON.parse(localStorage.fhirSettings) : servers[0];

  return {
    servers: servers,
    ensureSettingsAreAvailable: loadSettings,
    get: function() {
        var deferred = $q.defer();
        loadSettings().then(function() {deferred.resolve(settings);}, deferred.reject);
        return deferred.promise;
    },
    set: function(s){
        decorateWithType(s).then(function (st) {
            settings = st;
            localStorage.fhirSettings = JSON.stringify(settings);

            if (settings.auth.type !== "oauth2") {
                $rootScope.$emit('noauth-mode');
                //$route.reload();
            }

            $rootScope.$emit('new-settings');
        });
    },
    authServiceRequired: function () {
        return settings.auth.type === 'oauth2';
    }
  }

});

angular.module('fhirStarter').factory('oauth2', function($rootScope, $location) {

  var authorizing = false;

  return {
    authorizing: function(){
      return authorizing;
    },
    authorize: function(s){
      // window.location.origin does not exist in some non-webkit browsers
      if (!window.location.origin) {
         window.location.origin = window.location.protocol + "//" 
            + window.location.hostname 
            + (window.location.port ? ':' + window.location.port: '');
      }
    
      var thisUri = window.location.origin + window.location.pathname +'/';
      thisUrl = thisUri.replace(/\/+$/, "/");
      // TODO : remove registration step
      var client = {
        "client_id": "fhir_starter",
        "redirect_uri": thisUrl,
        "scope":  "smart/orchestrate_launch user/*.*"
      };
      authorizing = true;
      FHIR.oauth2.authorize({
        client: client,
        server: s.serviceUrl,
        from: $location.url()
      }, function (err) {
        authorizing = false;
        $rootScope.$emit('error', err);
        $rootScope.$emit('set-loading');
        $rootScope.$emit('clear-client');
        var loc = "/ui/select-patient";
        if ($location.url() !== loc) {
            $location.url(loc);
        }
        $rootScope.$digest();
      });
    }
  };

});

angular.module('fhirStarter').factory('patientSearch', function($route, $routeParams, $location, $window, $rootScope, $q, fhirSettings, oauth2) {

  console.log('initialzing pt search service');
  var smart = null;
  var didOauth = false;

  function initClient(){
    fhirSettings.get().then(function(settings) {
        if ($routeParams.code){
          delete sessionStorage.tokenResponse;
          FHIR.oauth2.ready($routeParams, function(smartNew){
            smart = smartNew;
            window.smart = smart;
            didOauth = true;
            $rootScope.$emit('new-client');
          });
        } else if (!didOauth && $routeParams.iss){
          oauth2.authorize({
            "name": "OAuth server issuing launch context request",
            "serviceUrl": decodeURIComponent($routeParams.iss),
            "auth": {
              "type": "oauth2"
            }
          });
        } else if (settings.auth && settings.auth.type === 'oauth2'){
          oauth2.authorize(settings);
        } else {
          smart = new FHIR.client(settings);
          $rootScope.$emit('new-client');
        }
    });
  }
  
  function onNewClient(){
    if (smart && smart.state && smart.state.from !== undefined){
        console.log(smart, 'back from', smart.state.from);
        $rootScope.$emit('signed-in');
        $location.url(smart.state.from);
        $rootScope.$digest();
    }
  }

  $rootScope.$on('$routeChangeSuccess', function (scope, next, current) {
    console.log('route changed', scope, next, current);
    console.log('so params', $routeParams);

    if (current === undefined) {
        //initClient();
    }
  });
  
  $rootScope.$on('reconnect-request', function(){
        fhirSettings.get().then(function(settings) {
            if (settings.auth && settings.auth.type == 'oauth2') {
                smart = null;
                initClient();
            }
        });
  });
  
  $rootScope.$on('clear-client', function(){
      smart = null;
      sessionStorage.clear();
  })

  $rootScope.$on('new-client', onNewClient);
  
  $rootScope.$on('init-client', function(e){
    initClient();
  });

  $rootScope.$on('new-settings', function(e){
    sessionStorage.clear();
    initClient();
    $location.url("/ui/select-patient");
    $route.reload();
  });


  var currentSearch;
  var pages = [];
  var atPage;

  return {
    atPage: function(){
      return atPage;
    },

    registerContext: function(app, params){
      d = $q.defer();

      var req =smart.authenticated({
        url: smart.server.serviceUrl + '/_services/smart/Launch',
        type: 'POST',
        contentType: "application/json",
        data: JSON.stringify({
          client_id: app.client_id,
          parameters:  params
        })
      });

      $.ajax(req)
      .done(d.resolve)
      .fail(d.reject);

      return d.promise;
    },

    search: function(p){
      d = $q.defer();
      q = {$sort: [['given','asc'],['family','asc']], _count:25};
      if (!smart){
        d.resolve([]);
        return d.promise;
      };
      if(p.tokens && p.tokens.length > 0) {
        q['name'] = p.tokens[0];
      }
      smart.api.search({type: 'Patient', query: q})
      .done(function(r){
        currentSearch = r.data;
        atPage = 0;
        pages = [currentSearch.entry.map(function(entry){return entry.resource;})];
        d.resolve(pages[0]);
        $rootScope.$digest();
      }).fail(function(){
        $rootScope.$emit('reconnect-request');
        $rootScope.$emit('error', 'Search failed (see console)');
        console.log("Search failed.");
        console.log(arguments);
        d.reject();
        $rootScope.$digest();
      });
      return d.promise;
    },
    
    hasNext: function(p){
      if (currentSearch) {
         if (currentSearch.link.find(function(e){return e.relation==='next';})) {
            return true;
         } else {
            return pages.length > atPage + 1;
         }
      } else {
         return false;
      }
    },

    previous: function(p){
      atPage -= 1;
      return pages[atPage];
    },

    next: function(p){
      atPage++;

      d = $q.defer();

      if (pages.length > atPage) {
        d.resolve(pages[atPage]);
      } else {
        smart.api.nextPage({bundle: currentSearch})
        .done(function(r){
          currentSearch = r.data;
          data = currentSearch.entry.map(function(entry){return entry.resource;});
          pages.push([data]);
          d.resolve(data);
          $rootScope.$digest();
        }).fail(function(){
            $rootScope.$emit('reconnect-request');
            $rootScope.$emit('error', 'Search failed (see console)');
            console.log("Search failed.");
            d.reject();
            $rootScope.$digest();
        });
      }

      return d.promise;
    },
    getOne: function(pid){
      // If it's already in our resource cache, return it.
      // Otherwise fetch a new copy and return that.
      d = $q.defer();
      /*
      // TO DO: implement this with fhir.js
      var p = smart.cache.get({resource:'Patient', id:pid});
      if (p !== null) {
        d.resolve(p);
        return d.promise;
      }
      */
      smart.api.read({type:"Patient", id:pid}).done(function(p){
        d.resolve(p.data);
        $rootScope.$digest();
      }).fail(function(){
        $rootScope.$emit('reconnect-request');
        $rootScope.$emit('error', 'Patient read failed (see console)');
        console.log("Patient read failed.");
        d.reject();
        $rootScope.$digest();
      });
      return d.promise;
    },
    smart: function(){
      return smart;
    },
    connected: function(){
      return smart !== null;
    },
    initClient: initClient
  };
});

angular.module('fhirStarter').factory('random', function() {
  var chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  return function randomString(length) {
    var result = '';
    for (var i = length; i > 0; --i) {
      result += chars[Math.round(Math.random() * (chars.length - 1))];
    }
    return result;
  }
});

angular.module('fhirStarter').factory('patient', function() {
  return {
    id: function(p){
      return p.id;
    },
    name: function(p){
      var name = p && p.name && p.name[0];
      if (!name) return null;

      return name.given.join(" ") + " " + name.family.join(" ");
    }
  };
});

angular.module('fhirStarter').factory('app', ['$http',function($http) {
  var apps = $http.get('fhirStarter/apps.json');
  return apps;
}]);

angular.module('fhirStarter').factory('customFhirApp', function() {

  var app = localStorage.customFhirApp ? 
  JSON.parse(localStorage.customFhirApp) : {id: "", url: ""};

  return {
    get: function(){return app;},
    set: function(app){
      localStorage.customFhirApp = JSON.stringify(app);
    }
  };

});

angular.module('fhirStarter').factory('tools', function() {

  return {
    decodeURLParam: function (url, param) {
        var query;
        var data;
        var result = [];
        
        try {
            query = decodeURIComponent(url).split("?")[1];
            data = query.split("&");
        } catch (err) {
            return null;
        }

        for(var i=0; i<data.length; i++) {
            var item = data[i].split("=");
            if (item[0] === param) {
              result.push(item[1]);
            }
        }

        if (result.length === 0){
            return null;
        }
        return result[0];
    }
  };

});
