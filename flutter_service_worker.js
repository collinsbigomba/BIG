'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"assets/AssetManifest.json": "0afe5758698d763196a193cc963d49ce",
"assets/assets/3.png": "516e72646afb3a1df2137b0da3d0f5b3",
"assets/assets/d.png": "7ae7dc74a30a91ac680cda69390b9a96",
"assets/assets/f.jpeg": "83fbdc7751feb23bde0ec9fdcfde60a2",
"assets/assets/index.png": "9be3ef62e71f21bdc8683c8fe9bd23a4",
"assets/assets/inex.jpeg": "93982983fd352caf8e2782c56bf11479",
"assets/assets/g.webp": "efea62af6ab3331683278eb49e7430ae",
"assets/assets/h.webp": "d531e4c479666f8b18e284be47e5fc47",
"assets/assets/e.jpeg": "2f0a7bfa09e74b977ab3da688a91dbb8",
"assets/assets/h.jpeg": "d2d7f94b2dde7f79904a57f095b4ff63",
"assets/assets/df.jpeg": "2aa1b6466eeb159054669ce245c2ac61",
"assets/assets/collins.jpg": "963044ca5f57e82c90cacb1b7ddf22d2",
"assets/assets/c.jpeg": "77b512038b770ec1422adb5271e5a2f1",
"assets/assets/imags.jpeg": "af9119479f3af40f4b3d5e92336a2467",
"assets/assets/l.jpg": "82d365dc867db1bf17f50dd3a154bc3f",
"assets/assets/b.jpeg": "e9123c2d2f1dcca0c34ef539c4fe0d46",
"assets/assets/k.jpg": "dd24407cf3db952a6cc3ea99de13a2c1",
"assets/assets/index.jpeg": "61b112fdf5ea4d24d604f9f0805ab09e",
"assets/assets/images.png": "3900f6747914634396ba4821ab7559b9",
"assets/assets/images%2520(1).jpeg": "37652de30b421d0890fdf3ae2638bae9",
"assets/assets/f.jpg": "18b4a32266587f52ce7ce429241b46e9",
"assets/assets/indx.jpeg": "a4e5f285dc76a54f5a0bc5c0b90f7cad",
"assets/assets/imges.jpeg": "27016f8b5ddb73243ef333a6dcc5dd3d",
"assets/assets/j.jpeg": "a6b4ab6ad81ebb4f5fad0476833f931f",
"assets/assets/images.jpeg": "701cefb2617812f2a363bda2cd34c26a",
"assets/assets/m.jpg": "4b40a39b623c0192202341ae81ca03a0",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/NOTICES": "531e8d67955fc2dac2f8bd5eef0bdef8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"version.json": "baf6f1f872481aaa642602b135eb9482",
"manifest.json": "08c21d927678d663037e30cbdfd02e1d",
"main.dart.js": "c4fc3809cf1abfe50138aeee6f75ed53",
"index.html": "84c6a719ddcb5af859cb7718da72db75",
"/": "84c6a719ddcb5af859cb7718da72db75"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
  for (var resourceKey in Object.keys(RESOURCES)) {
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
