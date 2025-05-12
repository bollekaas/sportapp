; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [334 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [662 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 254
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 288
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 329
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 209
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 272
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 272
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 292
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 228
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 176714968, ; 23: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 185
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 274
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 326
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 327
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 226
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 248
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 36: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 179
	i32 261689757, ; 37: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 231
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 250
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 247
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 298
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 43: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 44: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 326
	i32 318968648, ; 45: Xamarin.AndroidX.Activity.dll => 0x13031348 => 217
	i32 321597661, ; 46: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 47: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 311
	i32 342366114, ; 48: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 249
	i32 356389973, ; 49: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 310
	i32 360082299, ; 50: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 51: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 52: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 53: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 54: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 55: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 56: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 330
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 59: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 322
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 232
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 245
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 66: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 67: System.dll => 0x1bff388e => 164
	i32 476646585, ; 68: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 247
	i32 486930444, ; 69: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 260
	i32 498788369, ; 70: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 71: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 309
	i32 503918385, ; 72: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 303
	i32 513247710, ; 73: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 202
	i32 526420162, ; 74: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 75: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 292
	i32 530272170, ; 76: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 77: Microsoft.Extensions.Logging => 0x20216150 => 198
	i32 540030774, ; 78: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 79: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 80: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 81: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 82: Jsr305Binding => 0x213954e7 => 285
	i32 569601784, ; 83: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 283
	i32 571435654, ; 84: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 195
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 86: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 317
	i32 597488923, ; 87: CommunityToolkit.Maui => 0x239cf51b => 175
	i32 601371474, ; 88: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 89: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 90: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 91: Xamarin.AndroidX.CustomView => 0x2568904f => 237
	i32 627931235, ; 92: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 315
	i32 639843206, ; 93: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 243
	i32 643868501, ; 94: System.Net => 0x2660a755 => 81
	i32 662205335, ; 95: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 96: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 279
	i32 666292255, ; 97: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 224
	i32 672442732, ; 98: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 99: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 100: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 297
	i32 690569205, ; 101: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 102: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 294
	i32 693804605, ; 103: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 104: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 105: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 289
	i32 700358131, ; 106: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 107: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 312
	i32 709557578, ; 108: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 300
	i32 720511267, ; 109: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 293
	i32 722857257, ; 110: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 111: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 112: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 113: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 214
	i32 759454413, ; 114: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 115: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 116: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 117: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 321
	i32 789151979, ; 118: Microsoft.Extensions.Options => 0x2f0980eb => 201
	i32 790371945, ; 119: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 238
	i32 804008546, ; 120: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 183
	i32 804715423, ; 121: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 122: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 252
	i32 823281589, ; 123: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 124: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 125: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 126: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 127: Xamarin.AndroidX.Print => 0x3246f6cd => 265
	i32 873119928, ; 128: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 129: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 130: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 131: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 132: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 133: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 324
	i32 928116545, ; 134: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 288
	i32 952186615, ; 135: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 136: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 293
	i32 966729478, ; 137: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 286
	i32 967690846, ; 138: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 249
	i32 975236339, ; 139: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 140: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 141: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 142: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 143: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 144: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 145: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 197
	i32 1001831731, ; 146: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 147: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 269
	i32 1019214401, ; 148: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 149: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 192
	i32 1029334545, ; 150: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 299
	i32 1031528504, ; 151: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 287
	i32 1035644815, ; 152: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 222
	i32 1036536393, ; 153: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 154: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 155: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 256
	i32 1067306892, ; 156: GoogleGson => 0x3f9dcf8c => 177
	i32 1082857460, ; 157: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 158: Xamarin.Kotlin.StdLib => 0x409e66d8 => 290
	i32 1098259244, ; 159: System => 0x41761b2c => 164
	i32 1106973742, ; 160: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 189
	i32 1118262833, ; 161: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 312
	i32 1121599056, ; 162: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 255
	i32 1127624469, ; 163: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 200
	i32 1149092582, ; 164: Xamarin.AndroidX.Window => 0x447dc2e6 => 282
	i32 1168523401, ; 165: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 318
	i32 1170634674, ; 166: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 167: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 193
	i32 1175144683, ; 168: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 278
	i32 1178241025, ; 169: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 263
	i32 1203215381, ; 170: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 316
	i32 1204270330, ; 171: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 224
	i32 1208641965, ; 172: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 173: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1220193633, ; 174: Microsoft.Net.Http.Headers => 0x48baad61 => 210
	i32 1234928153, ; 175: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 314
	i32 1243150071, ; 176: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 283
	i32 1253011324, ; 177: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 178: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 298
	i32 1264511973, ; 179: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 273
	i32 1267360935, ; 180: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 277
	i32 1269851834, ; 181: BouncyCastle.Crypto => 0x4bb066ba => 174
	i32 1273260888, ; 182: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 229
	i32 1275534314, ; 183: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 294
	i32 1278448581, ; 184: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 221
	i32 1293217323, ; 185: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 240
	i32 1309188875, ; 186: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 187: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 282
	i32 1324164729, ; 188: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 189: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 190: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 191: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 328
	i32 1376866003, ; 192: Xamarin.AndroidX.SavedState => 0x52114ed3 => 269
	i32 1379779777, ; 193: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 194: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 195: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 233
	i32 1408764838, ; 196: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 197: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 198: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 199: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 296
	i32 1434145427, ; 200: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 201: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 286
	i32 1439761251, ; 202: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 203: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 204: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 205: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 194
	i32 1457743152, ; 206: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 207: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 208: es\Microsoft.Maui.Controls.resources => 0x57152abe => 302
	i32 1461234159, ; 209: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 210: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 211: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 212: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 223
	i32 1470490898, ; 213: Microsoft.Extensions.Primitives => 0x57a5e912 => 202
	i32 1479771757, ; 214: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 215: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 216: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 217: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 270
	i32 1493001747, ; 218: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 306
	i32 1511525525, ; 219: MySqlConnector => 0x5a180c95 => 211
	i32 1514721132, ; 220: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 301
	i32 1521091094, ; 221: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 197
	i32 1536373174, ; 222: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 223: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 224: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 225: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 183
	i32 1550322496, ; 226: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 227: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 321
	i32 1565862583, ; 228: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 229: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 230: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 231: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 232: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 239
	i32 1592978981, ; 233: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1596753216, ; 234: BouncyCastle.Crypto.dll => 0x5f2c8540 => 174
	i32 1597949149, ; 235: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 287
	i32 1601112923, ; 236: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 237: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 238: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 239: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 259
	i32 1622358360, ; 240: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 241: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 281
	i32 1632842087, ; 242: Microsoft.Extensions.Configuration.Json => 0x61533167 => 190
	i32 1634654947, ; 243: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 176
	i32 1635184631, ; 244: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 243
	i32 1636350590, ; 245: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 236
	i32 1639515021, ; 246: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 247: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 248: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 249: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 182
	i32 1657153582, ; 250: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 251: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 275
	i32 1658251792, ; 252: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 284
	i32 1670060433, ; 253: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 231
	i32 1675553242, ; 254: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 255: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 256: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 257: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 258: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 259: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 260: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 291
	i32 1701541528, ; 261: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 262: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 252
	i32 1726116996, ; 263: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 264: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 265: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 227
	i32 1736233607, ; 266: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 319
	i32 1743415430, ; 267: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 297
	i32 1744735666, ; 268: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 269: System.IO.Pipelines.dll => 0x68139a0d => 212
	i32 1746316138, ; 270: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 271: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 272: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 273: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 181
	i32 1763938596, ; 274: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 275: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 276: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 274
	i32 1770582343, ; 277: Microsoft.Extensions.Logging.dll => 0x6988f147 => 198
	i32 1776026572, ; 278: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 279: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 280: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 281: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 313
	i32 1788241197, ; 282: Xamarin.AndroidX.Fragment => 0x6a96652d => 245
	i32 1793755602, ; 283: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 305
	i32 1808609942, ; 284: Xamarin.AndroidX.Loader => 0x6bcd3296 => 259
	i32 1813058853, ; 285: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 290
	i32 1813201214, ; 286: Xamarin.Google.Android.Material => 0x6c13413e => 284
	i32 1818569960, ; 287: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 264
	i32 1818787751, ; 288: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 289: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 290: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 291: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 199
	i32 1842015223, ; 292: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 325
	i32 1847515442, ; 293: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 214
	i32 1853025655, ; 294: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 322
	i32 1858542181, ; 295: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 296: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 297: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 304
	i32 1879696579, ; 298: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 299: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 225
	i32 1888955245, ; 300: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 301: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 302: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 303: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 304: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 305: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 306: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 307: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 271
	i32 1968388702, ; 308: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 186
	i32 1983156543, ; 309: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 291
	i32 1985761444, ; 310: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 216
	i32 2003115576, ; 311: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 301
	i32 2011961780, ; 312: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 313: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 256
	i32 2025202353, ; 314: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 296
	i32 2031763787, ; 315: Xamarin.Android.Glide => 0x791a414b => 213
	i32 2045470958, ; 316: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 317: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 188
	i32 2055257422, ; 318: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 251
	i32 2060060697, ; 319: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 320: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 300
	i32 2070888862, ; 321: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 322: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 196
	i32 2073446628, ; 323: PassionProjectSport.dll => 0x7b9648e4 => 0
	i32 2079903147, ; 324: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 325: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 326: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 327: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 328: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 329: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 330: Microsoft.Maui => 0x80bd55ad => 207
	i32 2169148018, ; 331: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 308
	i32 2181898931, ; 332: Microsoft.Extensions.Options.dll => 0x820d22b3 => 201
	i32 2192057212, ; 333: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 199
	i32 2193016926, ; 334: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 335: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 295
	i32 2201231467, ; 336: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 337: it\Microsoft.Maui.Controls.resources => 0x839595db => 310
	i32 2217644978, ; 338: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 278
	i32 2222056684, ; 339: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 340: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 260
	i32 2252106437, ; 341: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 342: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 343: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 344: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 187
	i32 2267999099, ; 345: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 215
	i32 2270573516, ; 346: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 304
	i32 2279755925, ; 347: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 267
	i32 2293034957, ; 348: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 349: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 350: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 351: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 314
	i32 2305521784, ; 352: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 353: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 219
	i32 2320631194, ; 354: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 355: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 356: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 357: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 358: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 359: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 186
	i32 2378619854, ; 360: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 361: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 362: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 309
	i32 2401565422, ; 363: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 364: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 242
	i32 2411328690, ; 365: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 179
	i32 2421380589, ; 366: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 367: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 229
	i32 2424193859, ; 368: PassionProjectSport => 0x907e4343 => 0
	i32 2427813419, ; 369: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 306
	i32 2435356389, ; 370: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 371: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 372: Microsoft.JSInterop.dll => 0x919672ca => 203
	i32 2454642406, ; 373: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 374: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 375: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 376: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 232
	i32 2471841756, ; 377: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 378: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 379: Microsoft.Maui.Controls => 0x93dba8a1 => 205
	i32 2483903535, ; 380: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 381: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 382: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 383: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 384: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 254
	i32 2522472828, ; 385: Xamarin.Android.Glide.dll => 0x9659e17c => 213
	i32 2537015816, ; 386: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 178
	i32 2538310050, ; 387: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 388: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 307
	i32 2562349572, ; 389: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 390: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 391: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 255
	i32 2581819634, ; 392: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 277
	i32 2585220780, ; 393: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 394: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 395: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 180
	i32 2589602615, ; 396: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 397: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 193
	i32 2593496499, ; 398: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 316
	i32 2605712449, ; 399: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 295
	i32 2615233544, ; 400: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 246
	i32 2616218305, ; 401: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 200
	i32 2617129537, ; 402: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 403: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 404: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 236
	i32 2624644809, ; 405: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 241
	i32 2626831493, ; 406: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 311
	i32 2627185994, ; 407: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 408: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 409: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 250
	i32 2663391936, ; 410: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 215
	i32 2663698177, ; 411: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 412: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 413: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 414: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 415: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 416: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 182
	i32 2693849962, ; 417: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 418: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 275
	i32 2715334215, ; 419: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 420: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 421: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 422: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 423: Xamarin.AndroidX.Activity => 0xa2e0939b => 217
	i32 2735172069, ; 424: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 425: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 178
	i32 2737747696, ; 426: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 223
	i32 2740948882, ; 427: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 428: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 429: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 317
	i32 2758225723, ; 430: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 206
	i32 2764765095, ; 431: Microsoft.Maui.dll => 0xa4caf7a7 => 207
	i32 2765824710, ; 432: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 433: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 289
	i32 2778768386, ; 434: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 280
	i32 2779977773, ; 435: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 268
	i32 2785988530, ; 436: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 323
	i32 2788224221, ; 437: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 246
	i32 2801831435, ; 438: Microsoft.Maui.Graphics => 0xa7008e0b => 209
	i32 2803228030, ; 439: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 440: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 302
	i32 2810250172, ; 441: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 233
	i32 2819470561, ; 442: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 443: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 444: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 268
	i32 2824502124, ; 445: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 446: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 315
	i32 2833784645, ; 447: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 184
	i32 2838993487, ; 448: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 257
	i32 2849599387, ; 449: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 450: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 280
	i32 2855708567, ; 451: Xamarin.AndroidX.Transition => 0xaa36a797 => 276
	i32 2861098320, ; 452: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 453: Microsoft.Maui.Essentials => 0xaa8a4878 => 208
	i32 2868488919, ; 454: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 176
	i32 2870099610, ; 455: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 218
	i32 2875164099, ; 456: Jsr305Binding.dll => 0xab5f85c3 => 285
	i32 2875220617, ; 457: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 458: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 244
	i32 2887636118, ; 459: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 460: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 181
	i32 2899753641, ; 461: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 462: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 463: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 464: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 465: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 466: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 196
	i32 2916838712, ; 467: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 281
	i32 2919462931, ; 468: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 469: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 220
	i32 2936416060, ; 470: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 471: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 472: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 473: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 474: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2970759306, ; 475: BCrypt.Net-Next.dll => 0xb112308a => 173
	i32 2972252294, ; 476: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 477: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 240
	i32 2987532451, ; 478: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 271
	i32 2996846495, ; 479: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 253
	i32 3016983068, ; 480: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 273
	i32 3023353419, ; 481: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 482: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 248
	i32 3038032645, ; 483: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 330
	i32 3056245963, ; 484: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 270
	i32 3057625584, ; 485: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 261
	i32 3059408633, ; 486: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 487: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 488: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 489: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 308
	i32 3090735792, ; 490: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 491: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 492: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 493: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 494: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 495: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 496: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 497: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 498: GoogleGson.dll => 0xbba64c02 => 177
	i32 3159123045, ; 499: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 500: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 501: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 262
	i32 3192346100, ; 502: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 503: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 504: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 505: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 506: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 239
	i32 3220365878, ; 507: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 508: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 509: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 510: Xamarin.AndroidX.CardView => 0xc235e84d => 227
	i32 3265493905, ; 511: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 512: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 513: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 514: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 515: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 516: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 517: System.Text.Encoding => 0xc4a8494a => 135
	i32 3300764913, ; 518: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 185
	i32 3303498502, ; 519: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 520: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 303
	i32 3316684772, ; 521: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 522: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 237
	i32 3317144872, ; 523: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 524: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 225
	i32 3345895724, ; 525: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 266
	i32 3346324047, ; 526: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 263
	i32 3357674450, ; 527: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 320
	i32 3358260929, ; 528: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 529: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 218
	i32 3362522851, ; 530: Xamarin.AndroidX.Core => 0xc86c06e3 => 234
	i32 3366347497, ; 531: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 532: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 267
	i32 3381016424, ; 533: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 299
	i32 3395150330, ; 534: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 535: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 536: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 238
	i32 3406629867, ; 537: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 194
	i32 3421170118, ; 538: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 188
	i32 3428513518, ; 539: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 191
	i32 3429136800, ; 540: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 541: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 542: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 241
	i32 3445260447, ; 543: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 544: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 204
	i32 3463511458, ; 545: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 307
	i32 3464190856, ; 546: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 180
	i32 3471940407, ; 547: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3472012038, ; 548: BCrypt.Net-Next => 0xcef2b306 => 173
	i32 3476120550, ; 549: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 550: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 320
	i32 3484440000, ; 551: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 319
	i32 3485117614, ; 552: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 553: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 554: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 230
	i32 3500000672, ; 555: Microsoft.JSInterop => 0xd09dc5a0 => 203
	i32 3509114376, ; 556: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 557: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 558: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 559: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 560: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 561: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 562: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 327
	i32 3597029428, ; 563: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 216
	i32 3598340787, ; 564: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 565: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 566: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 567: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 265
	i32 3633644679, ; 568: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 220
	i32 3638274909, ; 569: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 570: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 251
	i32 3643446276, ; 571: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 324
	i32 3643854240, ; 572: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 262
	i32 3645089577, ; 573: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 574: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 187
	i32 3660523487, ; 575: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 576: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 577: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 226
	i32 3684561358, ; 578: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 230
	i32 3697841164, ; 579: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 329
	i32 3700866549, ; 580: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 581: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 235
	i32 3716563718, ; 582: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 583: Xamarin.AndroidX.Annotation => 0xdda814c6 => 219
	i32 3722202641, ; 584: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 190
	i32 3724971120, ; 585: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 261
	i32 3732100267, ; 586: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 587: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 184
	i32 3737834244, ; 588: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 589: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 590: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3758424670, ; 591: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 189
	i32 3786282454, ; 592: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 228
	i32 3792276235, ; 593: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 594: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 204
	i32 3802395368, ; 595: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 596: CommunityToolkit.Maui.dll => 0xe3886bf7 => 175
	i32 3819260425, ; 597: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 598: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 599: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 600: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 192
	i32 3844307129, ; 601: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 602: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 603: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 604: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 605: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 606: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 607: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 276
	i32 3888767677, ; 608: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 266
	i32 3889960447, ; 609: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 328
	i32 3896106733, ; 610: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 611: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 234
	i32 3901907137, ; 612: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 613: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 614: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 279
	i32 3928044579, ; 615: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 616: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 617: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 264
	i32 3945713374, ; 618: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 619: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 620: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 222
	i32 3959773229, ; 621: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 253
	i32 3980434154, ; 622: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 323
	i32 3987592930, ; 623: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 305
	i32 4003436829, ; 624: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 625: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 221
	i32 4023392905, ; 626: System.IO.Pipelines => 0xefd01a89 => 212
	i32 4025784931, ; 627: System.Memory => 0xeff49a63 => 62
	i32 4044155772, ; 628: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 210
	i32 4046471985, ; 629: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 206
	i32 4054681211, ; 630: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 631: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 632: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4079385022, ; 633: MySqlConnector.dll => 0xf32679be => 211
	i32 4094352644, ; 634: Microsoft.Maui.Essentials.dll => 0xf40add04 => 208
	i32 4099507663, ; 635: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 636: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 637: Xamarin.AndroidX.Emoji2 => 0xf479582c => 242
	i32 4102112229, ; 638: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 318
	i32 4125707920, ; 639: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 313
	i32 4126470640, ; 640: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 191
	i32 4127667938, ; 641: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 642: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 643: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 644: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 325
	i32 4151237749, ; 645: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 646: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 647: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 648: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 649: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 650: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 258
	i32 4185676441, ; 651: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 652: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 653: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 654: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 235
	i32 4258378803, ; 655: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 257
	i32 4260525087, ; 656: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 657: Microsoft.Maui.Controls.dll => 0xfea12dee => 205
	i32 4274976490, ; 658: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 659: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 258
	i32 4294648842, ; 660: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 195
	i32 4294763496 ; 661: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 244
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [662 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 254, ; 3
	i32 288, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 329, ; 9
	i32 124, ; 10
	i32 209, ; 11
	i32 102, ; 12
	i32 272, ; 13
	i32 107, ; 14
	i32 272, ; 15
	i32 139, ; 16
	i32 292, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 228, ; 21
	i32 132, ; 22
	i32 185, ; 23
	i32 274, ; 24
	i32 151, ; 25
	i32 326, ; 26
	i32 327, ; 27
	i32 18, ; 28
	i32 226, ; 29
	i32 26, ; 30
	i32 248, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 91, ; 35
	i32 179, ; 36
	i32 231, ; 37
	i32 147, ; 38
	i32 250, ; 39
	i32 247, ; 40
	i32 298, ; 41
	i32 54, ; 42
	i32 69, ; 43
	i32 326, ; 44
	i32 217, ; 45
	i32 83, ; 46
	i32 311, ; 47
	i32 249, ; 48
	i32 310, ; 49
	i32 131, ; 50
	i32 55, ; 51
	i32 149, ; 52
	i32 74, ; 53
	i32 145, ; 54
	i32 62, ; 55
	i32 146, ; 56
	i32 330, ; 57
	i32 165, ; 58
	i32 322, ; 59
	i32 232, ; 60
	i32 12, ; 61
	i32 245, ; 62
	i32 125, ; 63
	i32 152, ; 64
	i32 113, ; 65
	i32 166, ; 66
	i32 164, ; 67
	i32 247, ; 68
	i32 260, ; 69
	i32 84, ; 70
	i32 309, ; 71
	i32 303, ; 72
	i32 202, ; 73
	i32 150, ; 74
	i32 292, ; 75
	i32 60, ; 76
	i32 198, ; 77
	i32 51, ; 78
	i32 103, ; 79
	i32 114, ; 80
	i32 40, ; 81
	i32 285, ; 82
	i32 283, ; 83
	i32 195, ; 84
	i32 120, ; 85
	i32 317, ; 86
	i32 175, ; 87
	i32 52, ; 88
	i32 44, ; 89
	i32 119, ; 90
	i32 237, ; 91
	i32 315, ; 92
	i32 243, ; 93
	i32 81, ; 94
	i32 136, ; 95
	i32 279, ; 96
	i32 224, ; 97
	i32 8, ; 98
	i32 73, ; 99
	i32 297, ; 100
	i32 155, ; 101
	i32 294, ; 102
	i32 154, ; 103
	i32 92, ; 104
	i32 289, ; 105
	i32 45, ; 106
	i32 312, ; 107
	i32 300, ; 108
	i32 293, ; 109
	i32 109, ; 110
	i32 129, ; 111
	i32 25, ; 112
	i32 214, ; 113
	i32 72, ; 114
	i32 55, ; 115
	i32 46, ; 116
	i32 321, ; 117
	i32 201, ; 118
	i32 238, ; 119
	i32 183, ; 120
	i32 22, ; 121
	i32 252, ; 122
	i32 86, ; 123
	i32 43, ; 124
	i32 160, ; 125
	i32 71, ; 126
	i32 265, ; 127
	i32 3, ; 128
	i32 42, ; 129
	i32 63, ; 130
	i32 16, ; 131
	i32 53, ; 132
	i32 324, ; 133
	i32 288, ; 134
	i32 105, ; 135
	i32 293, ; 136
	i32 286, ; 137
	i32 249, ; 138
	i32 34, ; 139
	i32 158, ; 140
	i32 85, ; 141
	i32 32, ; 142
	i32 12, ; 143
	i32 51, ; 144
	i32 197, ; 145
	i32 56, ; 146
	i32 269, ; 147
	i32 36, ; 148
	i32 192, ; 149
	i32 299, ; 150
	i32 287, ; 151
	i32 222, ; 152
	i32 35, ; 153
	i32 58, ; 154
	i32 256, ; 155
	i32 177, ; 156
	i32 17, ; 157
	i32 290, ; 158
	i32 164, ; 159
	i32 189, ; 160
	i32 312, ; 161
	i32 255, ; 162
	i32 200, ; 163
	i32 282, ; 164
	i32 318, ; 165
	i32 153, ; 166
	i32 193, ; 167
	i32 278, ; 168
	i32 263, ; 169
	i32 316, ; 170
	i32 224, ; 171
	i32 29, ; 172
	i32 52, ; 173
	i32 210, ; 174
	i32 314, ; 175
	i32 283, ; 176
	i32 5, ; 177
	i32 298, ; 178
	i32 273, ; 179
	i32 277, ; 180
	i32 174, ; 181
	i32 229, ; 182
	i32 294, ; 183
	i32 221, ; 184
	i32 240, ; 185
	i32 85, ; 186
	i32 282, ; 187
	i32 61, ; 188
	i32 112, ; 189
	i32 57, ; 190
	i32 328, ; 191
	i32 269, ; 192
	i32 99, ; 193
	i32 19, ; 194
	i32 233, ; 195
	i32 111, ; 196
	i32 101, ; 197
	i32 102, ; 198
	i32 296, ; 199
	i32 104, ; 200
	i32 286, ; 201
	i32 71, ; 202
	i32 38, ; 203
	i32 32, ; 204
	i32 194, ; 205
	i32 103, ; 206
	i32 73, ; 207
	i32 302, ; 208
	i32 9, ; 209
	i32 123, ; 210
	i32 46, ; 211
	i32 223, ; 212
	i32 202, ; 213
	i32 9, ; 214
	i32 43, ; 215
	i32 4, ; 216
	i32 270, ; 217
	i32 306, ; 218
	i32 211, ; 219
	i32 301, ; 220
	i32 197, ; 221
	i32 31, ; 222
	i32 138, ; 223
	i32 92, ; 224
	i32 183, ; 225
	i32 93, ; 226
	i32 321, ; 227
	i32 49, ; 228
	i32 141, ; 229
	i32 112, ; 230
	i32 140, ; 231
	i32 239, ; 232
	i32 115, ; 233
	i32 174, ; 234
	i32 287, ; 235
	i32 157, ; 236
	i32 76, ; 237
	i32 79, ; 238
	i32 259, ; 239
	i32 37, ; 240
	i32 281, ; 241
	i32 190, ; 242
	i32 176, ; 243
	i32 243, ; 244
	i32 236, ; 245
	i32 64, ; 246
	i32 138, ; 247
	i32 15, ; 248
	i32 182, ; 249
	i32 116, ; 250
	i32 275, ; 251
	i32 284, ; 252
	i32 231, ; 253
	i32 48, ; 254
	i32 70, ; 255
	i32 80, ; 256
	i32 126, ; 257
	i32 94, ; 258
	i32 121, ; 259
	i32 291, ; 260
	i32 26, ; 261
	i32 252, ; 262
	i32 97, ; 263
	i32 28, ; 264
	i32 227, ; 265
	i32 319, ; 266
	i32 297, ; 267
	i32 149, ; 268
	i32 212, ; 269
	i32 169, ; 270
	i32 4, ; 271
	i32 98, ; 272
	i32 181, ; 273
	i32 33, ; 274
	i32 93, ; 275
	i32 274, ; 276
	i32 198, ; 277
	i32 21, ; 278
	i32 41, ; 279
	i32 170, ; 280
	i32 313, ; 281
	i32 245, ; 282
	i32 305, ; 283
	i32 259, ; 284
	i32 290, ; 285
	i32 284, ; 286
	i32 264, ; 287
	i32 2, ; 288
	i32 134, ; 289
	i32 111, ; 290
	i32 199, ; 291
	i32 325, ; 292
	i32 214, ; 293
	i32 322, ; 294
	i32 58, ; 295
	i32 95, ; 296
	i32 304, ; 297
	i32 39, ; 298
	i32 225, ; 299
	i32 25, ; 300
	i32 94, ; 301
	i32 89, ; 302
	i32 99, ; 303
	i32 10, ; 304
	i32 87, ; 305
	i32 100, ; 306
	i32 271, ; 307
	i32 186, ; 308
	i32 291, ; 309
	i32 216, ; 310
	i32 301, ; 311
	i32 7, ; 312
	i32 256, ; 313
	i32 296, ; 314
	i32 213, ; 315
	i32 88, ; 316
	i32 188, ; 317
	i32 251, ; 318
	i32 154, ; 319
	i32 300, ; 320
	i32 33, ; 321
	i32 196, ; 322
	i32 0, ; 323
	i32 116, ; 324
	i32 82, ; 325
	i32 20, ; 326
	i32 11, ; 327
	i32 162, ; 328
	i32 3, ; 329
	i32 207, ; 330
	i32 308, ; 331
	i32 201, ; 332
	i32 199, ; 333
	i32 84, ; 334
	i32 295, ; 335
	i32 64, ; 336
	i32 310, ; 337
	i32 278, ; 338
	i32 143, ; 339
	i32 260, ; 340
	i32 157, ; 341
	i32 41, ; 342
	i32 117, ; 343
	i32 187, ; 344
	i32 215, ; 345
	i32 304, ; 346
	i32 267, ; 347
	i32 131, ; 348
	i32 75, ; 349
	i32 66, ; 350
	i32 314, ; 351
	i32 172, ; 352
	i32 219, ; 353
	i32 143, ; 354
	i32 106, ; 355
	i32 151, ; 356
	i32 70, ; 357
	i32 156, ; 358
	i32 186, ; 359
	i32 121, ; 360
	i32 127, ; 361
	i32 309, ; 362
	i32 152, ; 363
	i32 242, ; 364
	i32 179, ; 365
	i32 141, ; 366
	i32 229, ; 367
	i32 0, ; 368
	i32 306, ; 369
	i32 20, ; 370
	i32 14, ; 371
	i32 203, ; 372
	i32 135, ; 373
	i32 75, ; 374
	i32 59, ; 375
	i32 232, ; 376
	i32 167, ; 377
	i32 168, ; 378
	i32 205, ; 379
	i32 15, ; 380
	i32 74, ; 381
	i32 6, ; 382
	i32 23, ; 383
	i32 254, ; 384
	i32 213, ; 385
	i32 178, ; 386
	i32 91, ; 387
	i32 307, ; 388
	i32 1, ; 389
	i32 136, ; 390
	i32 255, ; 391
	i32 277, ; 392
	i32 134, ; 393
	i32 69, ; 394
	i32 180, ; 395
	i32 146, ; 396
	i32 193, ; 397
	i32 316, ; 398
	i32 295, ; 399
	i32 246, ; 400
	i32 200, ; 401
	i32 88, ; 402
	i32 96, ; 403
	i32 236, ; 404
	i32 241, ; 405
	i32 311, ; 406
	i32 31, ; 407
	i32 45, ; 408
	i32 250, ; 409
	i32 215, ; 410
	i32 109, ; 411
	i32 158, ; 412
	i32 35, ; 413
	i32 22, ; 414
	i32 114, ; 415
	i32 182, ; 416
	i32 57, ; 417
	i32 275, ; 418
	i32 144, ; 419
	i32 118, ; 420
	i32 120, ; 421
	i32 110, ; 422
	i32 217, ; 423
	i32 139, ; 424
	i32 178, ; 425
	i32 223, ; 426
	i32 54, ; 427
	i32 105, ; 428
	i32 317, ; 429
	i32 206, ; 430
	i32 207, ; 431
	i32 133, ; 432
	i32 289, ; 433
	i32 280, ; 434
	i32 268, ; 435
	i32 323, ; 436
	i32 246, ; 437
	i32 209, ; 438
	i32 159, ; 439
	i32 302, ; 440
	i32 233, ; 441
	i32 163, ; 442
	i32 132, ; 443
	i32 268, ; 444
	i32 161, ; 445
	i32 315, ; 446
	i32 184, ; 447
	i32 257, ; 448
	i32 140, ; 449
	i32 280, ; 450
	i32 276, ; 451
	i32 169, ; 452
	i32 208, ; 453
	i32 176, ; 454
	i32 218, ; 455
	i32 285, ; 456
	i32 40, ; 457
	i32 244, ; 458
	i32 81, ; 459
	i32 181, ; 460
	i32 56, ; 461
	i32 37, ; 462
	i32 97, ; 463
	i32 166, ; 464
	i32 172, ; 465
	i32 196, ; 466
	i32 281, ; 467
	i32 82, ; 468
	i32 220, ; 469
	i32 98, ; 470
	i32 30, ; 471
	i32 159, ; 472
	i32 18, ; 473
	i32 127, ; 474
	i32 173, ; 475
	i32 119, ; 476
	i32 240, ; 477
	i32 271, ; 478
	i32 253, ; 479
	i32 273, ; 480
	i32 165, ; 481
	i32 248, ; 482
	i32 330, ; 483
	i32 270, ; 484
	i32 261, ; 485
	i32 170, ; 486
	i32 16, ; 487
	i32 144, ; 488
	i32 308, ; 489
	i32 125, ; 490
	i32 118, ; 491
	i32 38, ; 492
	i32 115, ; 493
	i32 47, ; 494
	i32 142, ; 495
	i32 117, ; 496
	i32 34, ; 497
	i32 177, ; 498
	i32 95, ; 499
	i32 53, ; 500
	i32 262, ; 501
	i32 129, ; 502
	i32 153, ; 503
	i32 24, ; 504
	i32 161, ; 505
	i32 239, ; 506
	i32 148, ; 507
	i32 104, ; 508
	i32 89, ; 509
	i32 227, ; 510
	i32 60, ; 511
	i32 142, ; 512
	i32 100, ; 513
	i32 5, ; 514
	i32 13, ; 515
	i32 122, ; 516
	i32 135, ; 517
	i32 185, ; 518
	i32 28, ; 519
	i32 303, ; 520
	i32 72, ; 521
	i32 237, ; 522
	i32 24, ; 523
	i32 225, ; 524
	i32 266, ; 525
	i32 263, ; 526
	i32 320, ; 527
	i32 137, ; 528
	i32 218, ; 529
	i32 234, ; 530
	i32 168, ; 531
	i32 267, ; 532
	i32 299, ; 533
	i32 101, ; 534
	i32 123, ; 535
	i32 238, ; 536
	i32 194, ; 537
	i32 188, ; 538
	i32 191, ; 539
	i32 163, ; 540
	i32 167, ; 541
	i32 241, ; 542
	i32 39, ; 543
	i32 204, ; 544
	i32 307, ; 545
	i32 180, ; 546
	i32 17, ; 547
	i32 173, ; 548
	i32 171, ; 549
	i32 320, ; 550
	i32 319, ; 551
	i32 137, ; 552
	i32 150, ; 553
	i32 230, ; 554
	i32 203, ; 555
	i32 155, ; 556
	i32 130, ; 557
	i32 19, ; 558
	i32 65, ; 559
	i32 147, ; 560
	i32 47, ; 561
	i32 327, ; 562
	i32 216, ; 563
	i32 79, ; 564
	i32 61, ; 565
	i32 106, ; 566
	i32 265, ; 567
	i32 220, ; 568
	i32 49, ; 569
	i32 251, ; 570
	i32 324, ; 571
	i32 262, ; 572
	i32 14, ; 573
	i32 187, ; 574
	i32 68, ; 575
	i32 171, ; 576
	i32 226, ; 577
	i32 230, ; 578
	i32 329, ; 579
	i32 78, ; 580
	i32 235, ; 581
	i32 108, ; 582
	i32 219, ; 583
	i32 190, ; 584
	i32 261, ; 585
	i32 67, ; 586
	i32 184, ; 587
	i32 63, ; 588
	i32 27, ; 589
	i32 160, ; 590
	i32 189, ; 591
	i32 228, ; 592
	i32 10, ; 593
	i32 204, ; 594
	i32 11, ; 595
	i32 175, ; 596
	i32 78, ; 597
	i32 126, ; 598
	i32 83, ; 599
	i32 192, ; 600
	i32 66, ; 601
	i32 107, ; 602
	i32 65, ; 603
	i32 128, ; 604
	i32 122, ; 605
	i32 77, ; 606
	i32 276, ; 607
	i32 266, ; 608
	i32 328, ; 609
	i32 8, ; 610
	i32 234, ; 611
	i32 2, ; 612
	i32 44, ; 613
	i32 279, ; 614
	i32 156, ; 615
	i32 128, ; 616
	i32 264, ; 617
	i32 23, ; 618
	i32 133, ; 619
	i32 222, ; 620
	i32 253, ; 621
	i32 323, ; 622
	i32 305, ; 623
	i32 29, ; 624
	i32 221, ; 625
	i32 212, ; 626
	i32 62, ; 627
	i32 210, ; 628
	i32 206, ; 629
	i32 90, ; 630
	i32 87, ; 631
	i32 148, ; 632
	i32 211, ; 633
	i32 208, ; 634
	i32 36, ; 635
	i32 86, ; 636
	i32 242, ; 637
	i32 318, ; 638
	i32 313, ; 639
	i32 191, ; 640
	i32 50, ; 641
	i32 6, ; 642
	i32 90, ; 643
	i32 325, ; 644
	i32 21, ; 645
	i32 162, ; 646
	i32 96, ; 647
	i32 50, ; 648
	i32 113, ; 649
	i32 258, ; 650
	i32 130, ; 651
	i32 76, ; 652
	i32 27, ; 653
	i32 235, ; 654
	i32 257, ; 655
	i32 7, ; 656
	i32 205, ; 657
	i32 110, ; 658
	i32 258, ; 659
	i32 195, ; 660
	i32 244 ; 661
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
