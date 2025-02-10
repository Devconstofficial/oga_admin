'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "c8021101e33e0bf51a09542ab191aa63",
"assets/AssetManifest.bin.json": "69e8f56ff9111a909d84c5e4a1df62e4",
"assets/AssetManifest.json": "358f2370bd6c62cb93149f96da54f564",
"assets/assets/fonts/HelveticaNeueBlack.otf": "47fb372c5e2d5861921e6f4bad10d1f2",
"assets/assets/fonts/HelveticaNeueLight.otf": "bfbaeacd0e20bdc3d9bb57e417b5e693",
"assets/assets/fonts/HelveticaNeueMedium.otf": "3de700a4650f63d566ee3e19cf1d1511",
"assets/assets/fonts/HelveticaWorld-Regular.ttf": "75d038d0a7e452f30eb332e7bcbda173",
"assets/assets/fonts/RecoletaFontFamily.otf": "4136b1b0537d776fbf9db85b43972097",
"assets/assets/icons/cross.svg": "2dbc47416fe178bbf5743a40fd28b68b",
"assets/assets/icons/dashboard.png": "cbf7dcea467e6271b47bc800ec4a116d",
"assets/assets/icons/dashboard.svg": "985caf3eee464e68a3e4338569b51aee",
"assets/assets/icons/delete.svg": "f63c92ad68eb3694d4f543549520ad60",
"assets/assets/icons/edit.svg": "f6b062dcf02062944a78ba3eb0f29c48",
"assets/assets/icons/edit1.svg": "1b7e4b66981fb6d98a3433b25689c2c4",
"assets/assets/icons/eye_icon.png": "03c7a2d9518d40492dcfdf0e198ac076",
"assets/assets/icons/eye_icon.svg": "f1dfa533918075867897d048fdba2604",
"assets/assets/icons/filter.svg": "beb0d0bed39ac0845d8ed3b7b954ed64",
"assets/assets/icons/logout.svg": "ec25aca8b9d35675db6d130538cd3e06",
"assets/assets/icons/noti.svg": "023eeba8624b48e5956012eeff3504f5",
"assets/assets/icons/user.svg": "b03f92d35a7a53df0eb79f11d39dd45d",
"assets/assets/images/app_logo.svg": "d60d1bc2e2a542e57df4e661444258b7",
"assets/assets/images/app_logo_transparent.png": "7dc51f03f34fc9d07cae5f40dbff3631",
"assets/assets/images/app_logo_white.png": "a4121070258b4622f415d09f79873665",
"assets/assets/images/avatar.png": "fbdeabff112bb47cd208ba1b364a5fce",
"assets/assets/images/user1.png": "9f3167fc27a3728a511f9a126b249423",
"assets/FontManifest.json": "f1318874d2ffac134da9233640253b2e",
"assets/fonts/MaterialIcons-Regular.otf": "89e2323cac4d91b43640011bf0398c1b",
"assets/NOTICES": "db1385e583d0494e2db7e84082247ab6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "132ad788dccb5d9e4f1bec4b15966217",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6eb93cd31eb69a23c2c4a36632e79080",
"/": "6eb93cd31eb69a23c2c4a36632e79080",
"main.dart.js": "7ad3e9ad7848e67111693fd6f67ece8e",
"manifest.json": "ef8c77a01002b11d13f377dc9959d86e",
"version.json": "136475df7aea3bcd70e529b1423e1a14"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
