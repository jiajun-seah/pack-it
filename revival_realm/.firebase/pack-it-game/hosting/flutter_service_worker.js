'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "2f8123a0bb8157438236fa2ef3653416",
"index.html": "2d952cbd6c976a8c03d7c4c6cd9df6db",
"/": "2d952cbd6c976a8c03d7c4c6cd9df6db",
"main.dart.js": "4c8e2b8062a3dbb0141e9dc6669cd87c",
"flutter.js": "4af2b91eb221b73845365e1302528f07",
"favicon.png": "4bf8c541a791397e405e719674bcd742",
"icons/Icon-192.png": "facf2f14e228743d508fcaf6ae6109dd",
"icons/Icon-maskable-192.png": "54c70858a3ff197450751d2b74698195",
"icons/Icon-maskable-512.png": "7585f22c2c0195e2d3f02d2db692265b",
"icons/Icon-512.png": "4f6fa007afb1c99d9dd4aa0dd1bc7e6b",
"manifest.json": "3e5f3ead1e6105af542ee0a8268af9a4",
"assets/AssetManifest.json": "06b3bb0a500844b19bd27ec77f439dda",
"assets/NOTICES": "b7a1f3e32772f5b42c8bc5b1779eca5b",
"assets/FontManifest.json": "6edf8accc337f7b726147308a032dbb5",
"assets/AssetManifest.bin.json": "9775da533e0527c2d54cbd8ce7f1750c",
"assets/packages/nes_ui/google_fonts/OFL.txt": "5096248a0ad125929b038a264f57b570",
"assets/packages/nes_ui/google_fonts/PressStart2P-Regular.ttf": "f98cd910425bf727bd54ce767a9b6884",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "8ff364f9fd0b1f0f7f978b3b05f09533",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b7b631f4e234d65866c09835463e7a63",
"assets/fonts/MaterialIcons-Regular.otf": "5b706bac6cdcd2e24f80d00d29cb78dc",
"assets/assets/images/title/title_background_animated.gif": "1f200021cab46f6f4f152bf4792d437d",
"assets/assets/images/title/title_background_animated.png": "595254f5acf1d877291c7e09714dee88",
"assets/assets/images/title/simple_background.png": "1f9fe1318b29599e76ff36c8a21ac761",
"assets/assets/images/title/falling_leaf.gif": "6047fe84a2879e8c6bbc66a53da6629c",
"assets/assets/images/title/pack_it_logo.png": "848126dee85cdd5c09bdd8cb5047de6b",
"assets/assets/images/title/pack_it_logo_cropped.png": "a5feedbb6175191b16aea6cfe7a51930",
"assets/assets/images/foods/Watermelon.gif": "c14bd5507dc3dbb8437407f5fb645be4",
"assets/assets/images/foods/sandwich_tr.gif": "e84ae2e5528ae78ff7ee60e62918232a",
"assets/assets/images/foods/sushi_2.gif": "6fb61862cc698afda381c8f3d87cec93",
"assets/assets/images/foods/sushi_3.gif": "757e7e6ddebc006cd83bbb657dbe726c",
"assets/assets/images/foods/Apple.gif": "586f08826d5e12ff5049d4c159cc68a2",
"assets/assets/images/foods/level_6_lid.png": "5d299d5a317bb0db6feb08f47a6a3525",
"assets/assets/images/foods/Orange_Swiss.gif": "030ccafc92343ab23b446f82f4028fee",
"assets/assets/images/foods/sushi_1.gif": "5f0da8f864d5e3d29c624688fbec6f6b",
"assets/assets/images/foods/Olive.gif": "ca6aef234c7c47ce1706407d1962267b",
"assets/assets/images/foods/level_6_board.png": "924a0e587d11b2f5603dd02980b84af0",
"assets/assets/images/foods/Lime_Swiss.gif": "35c1e2f9f7fb45bae74e896a59877462",
"assets/assets/images/foods/Rice.gif": "be2903ad9e512f793d95988ff8371d26",
"assets/assets/images/foods/pear.gif": "be03a36a93d997912eb440438f8bcf14",
"assets/assets/images/foods/sushi_4.gif": "22cfbf1b57ae00bc5ff2a7809c57292b",
"assets/assets/images/foods/sushi_5.gif": "6f8868af65b57ce573ea78d34b7b0b92",
"assets/assets/images/foods/Curry.gif": "7efc7c78dec2a50f8c1baf6f13a2dc90",
"assets/assets/images/foods/sushi_6.gif": "811a80faca6b9dfda4dd03a93b17b36f",
"assets/assets/images/foods/sandwich_bl.gif": "9b7dfdb12d154d12d00067c4c7e571ed",
"assets/assets/images/foods/Chocolate_Swiss.gif": "1d62f869692118c79db032929e70d628",
"assets/assets/images/foods/level_7_lid.png": "9697bcc41c9e834efe6b736f8f42becc",
"assets/assets/images/foods/Blackcurrent.gif": "82f83d20637ec3b40960e3111bc83992",
"assets/assets/images/foods/Cranberry.gif": "59cae721390ecacaff4ea6e74669802e",
"assets/assets/images/foods/Orange_l.gif": "93fd72df217b4a1c0280a42de5b48fc4",
"assets/assets/images/foods/Strawberry_Swirl.gif": "2eea60d74e55ee6857d497c3d61bc7b7",
"assets/assets/images/foods/Plum.gif": "8afa31d42a4925487c2ee718a5df94cd",
"assets/assets/images/foods/Banana.gif": "6f03836948c2b03a7a2b12fdb8103fdf",
"assets/assets/images/foods/Lemon.gif": "1c414fcbc683747cbc8ebc7fb5b91429",
"assets/assets/images/foods/Vanilla_Glazed.gif": "a6812cf60029023c629206bd748d476d",
"assets/assets/images/foods/Strawberry.gif": "b459371e66e323deedb5532712c4cd6c",
"assets/assets/images/foods/level_5_lid.png": "7a72be921b2c3c0526a89350761ee9ba",
"assets/assets/images/foods/Lettuce.gif": "fff5692cffb73ba963b1c2eb9699a8a4",
"assets/assets/images/foods/level_7_board.png": "2338b3399a74088833f7d7516798e92a",
"assets/assets/images/foods/level_4_lid.png": "5ce3014bf0bf5ba4562ba0084a13f844",
"assets/assets/images/foods/Kiwi.gif": "de4bd5540267e53cacc43f4f50c80d9b",
"assets/assets/images/foods/level_1_board.png": "9956c2c95b1f4b51de44c79da3bc22d8",
"assets/assets/images/foods/Orange_r.gif": "9d1d63111145e5e3dcc6ae85c52d860c",
"assets/assets/images/foods/Mushroom.gif": "8f16e49e36728b44630b30a0a4be3209",
"assets/assets/images/foods/level_8_lid.png": "b00075f418dcf835d23d1f30a09b1512",
"assets/assets/images/foods/transparent_square.png": "d0c31b153b6429bdc1d1b9e0f7ae21d9",
"assets/assets/images/foods/level_4_board.png": "9efcee1d873f32c18e31ea07fc55e6a5",
"assets/assets/images/foods/level_1_lid.png": "0c1dc407f9900ba1b7fcef3d8e08206a",
"assets/assets/images/foods/Chocolate_Sprinkle.gif": "ab7890e7f38d7a92654064767adb1368",
"assets/assets/images/foods/curry_L.gif": "707ff12d815ac9009d9a173f8282c057",
"assets/assets/images/foods/Blueberry_Swiss.gif": "710ed6f209cd4d034bf21694739186d4",
"assets/assets/images/foods/rice_L2.gif": "334fa619969a5544fb426da47495e709",
"assets/assets/images/foods/styrofoam_open.png": "7d0fb4c16ce99abaa72f6770b85e5515",
"assets/assets/images/foods/Rice_L.gif": "9064d04cf1676dd60402069969a1f36b",
"assets/assets/images/foods/Strawberry_Swiss.gif": "928b15ff9a1e37de2b2adada61e27cb2",
"assets/assets/images/foods/level_2_board.png": "56378cff578c890750125541bb7e74c7",
"assets/assets/images/foods/Grey_L.png": "41fb46086eb1032d532da58d2213637d",
"assets/assets/images/foods/styrofoam.png": "fddde50e06d0a0b234e605cdd30dc754",
"assets/assets/images/foods/level_2_lid.png": "8803bfbde3d92a412f990507854fbd30",
"assets/assets/images/foods/level_8_board.png": "b83ee724bdbfddb90d41441d659e2165",
"assets/assets/images/foods/sandwich_tl.gif": "232dc23d38c17263127f05e0c23aa089",
"assets/assets/images/foods/Chocolate_Swirl.gif": "86540e5674ac9670f550e33d1c92b0db",
"assets/assets/images/foods/Strawberry_Sprinkle.gif": "acc785c2a1791a4994439deb6484c1ec",
"assets/assets/images/foods/Blueberry.gif": "6f0224bcac529fbc49ba589765c21e19",
"assets/assets/images/foods/level_5_board.png": "b1073b0b9efd9611ec4106bf2da61cdf",
"assets/assets/images/foods/Grape_Swiss.gif": "4724f218a2c12218e160b53b20c94aa5",
"assets/assets/images/foods/Mango.gif": "faa84a787cfe43abe2fd50e51b3a6453",
"assets/assets/images/foods/Strawberry_Glazed.gif": "f5b22163c2845178b2a4bf651d700187",
"assets/assets/images/foods/maki_1.gif": "363e8720d241f8174c5fbc20771b61ca",
"assets/assets/images/foods/Stick.gif": "4a8685bfd66366b3fe8692180293bf09",
"assets/assets/images/foods/Grape.gif": "bd4b38222c5d589d0ac85f620662dbe4",
"assets/assets/images/foods/styrofoam_closed.png": "61bd2ff13ba46d36cb0418c9946052da",
"assets/assets/images/foods/level_3_lid.png": "3b5ec48ea5f97ba6476176edabd4d135",
"assets/assets/images/foods/maki_2.gif": "7a28e67f542f26024f7dfcb0411ebf61",
"assets/assets/images/foods/maki_3.gif": "21964fd9fff9fc448353c87e4048b5d9",
"assets/assets/images/foods/sandwich_br.gif": "3ca2a429b3354157933836b193338d86",
"assets/assets/images/foods/level_3_board.png": "b06776f84c5e03e950c52f6a47d24759",
"assets/assets/audio/music/pack_it_bgm_extended.mp3": "1c30aada8981f5aacb6bebdb30783fb5",
"assets/assets/audio/sfx/chime.mp3": "ef493606a2b088ede0ac4588f277b964",
"assets/assets/audio/sfx/pop1.mp3": "ea9f7d987e008992460cc64ade3eda0d",
"assets/assets/audio/sfx/pop2.mp3": "77f74d991d4fa14508b082528fb3c1c8",
"assets/assets/audio/sfx/pop3.mp3": "60b2c52c01ec2d044a484ad1a5fffeb5",
"assets/assets/audio/sfx/README.md": "c2318c37838f1811dd8a00d1bd6220a8",
"assets/assets/audio/sfx/peel4.mp3": "88b91842ce4ee066f66cd44cc4f6965b",
"assets/assets/audio/sfx/peel3.mp3": "669dc206268fe118a9526b71f7c5bb08",
"assets/assets/audio/sfx/peel2.mp3": "11b889542e3131fdda2628524f45ed18",
"assets/assets/audio/sfx/peel1.mp3": "9c6837f1ff4fda26006514e5ce502b2f",
"assets/assets/fonts/Halogen.ttf": "5d9e72f413a0c6c2cadf93edccf32db2",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "c2a129b5ada256d1eca56a94fd851c43",
"canvaskit/canvaskit.js.symbols": "c5efe8c4c528c87d6d3b89998f3916c1",
"canvaskit/skwasm.wasm": "896b91d35d8069237ef09954668ebf06",
"canvaskit/chromium/canvaskit.js.symbols": "8aee53b6c2f3937ec2e6b52fe0b63c88",
"canvaskit/chromium/canvaskit.js": "2f82009588e8a72043db753d360d488f",
"canvaskit/chromium/canvaskit.wasm": "ab07fbfc0e3cb4c6778d791ca5951048",
"canvaskit/canvaskit.js": "7737f5fc722b6a040ac15271ea8d92fb",
"canvaskit/canvaskit.wasm": "6812ea43965530e949b9b74209d49969",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
