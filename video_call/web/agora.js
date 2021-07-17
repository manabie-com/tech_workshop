var client;
var myUid;
var videoTrack;

// function createClient() {
//     client = AgoraRTC.createClient();
//     client.on("user-published", async (user, mediaType) => {
//       await client.subscribe(user, mediaType);
//       if (mediaType === "video") {
//         var view = findElementView('your_camera');
//         if (view != null && view != undefined) {
//             user.videoTrack.play(view);
//         }
//       }
//     });
// }
//
// async function join(appId, channel) {
//     myUid = await client.join(appId, channel, null);
//     if (videoTrack != null && videoTrack != undefined) {
//         client.publish(Object.values({ videoTrack: videoTrack }));
//     }
// }
//
// async function enableCamera() {
//     videoTrack = await AgoraRTC.createCameraVideoTrack();
//     if (myUid != null && myUid != undefined) {
//         client.publish(Object.values({ videoTrack: videoTrack }));
//     }
//     var view = findElementView('my_camera');
//     if (view != null && view != undefined) {
//         videoTrack.play(view);
//     }
// }
//
// function findElementView(userId) {
//     var view;
//     document.querySelectorAll('flt-platform-view').forEach(function (element) {
//         if (view == null || view == undefined) {
//             view = element.shadowRoot.getElementById(userId);
//         }
//     });
//     return view;
// }