# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER=1.90

CRATES="
	adler2@2.0.1
	aes@0.8.4
	aes@0.9.3
	aho-corasick@1.1.5
	alloc-no-stdlib@2.0.4
	alloc-no-stdlib@3.0.0
	alloc-stdlib@0.2.4
	alloc-stdlib@0.3.0
	alsa@0.11.0
	alsa-sys@0.4.0
	android_system_properties@0.1.6
	anyhow@1.0.104
	arbitrary@1.5.0
	arboard@3.6.1
	async-broadcast@0.7.2
	async-channel@2.5.0
	async-executor@1.14.0
	async-io@2.6.0
	async-lock@3.4.2
	async-process@2.5.0
	async-recursion@1.1.1
	async-signal@0.2.14
	async-task@4.7.1
	async-trait@0.1.92
	atk@0.18.2
	atk-sys@0.18.2
	atomic-waker@1.1.2
	auto-launch@0.5.0
	autocfg@1.5.1
	base64@0.21.7
	base64@0.22.1
	base64@0.23.1
	bit-set@0.8.0
	bit-vec@0.8.0
	bitflags@1.3.2
	bitflags@2.13.2
	block-buffer@0.10.4
	block-buffer@0.12.1
	block-padding@0.3.3
	block-padding@0.4.2
	block2@0.6.2
	blocking@1.7.0
	brotli@9.0.0
	brotli-decompressor@5.0.3
	brotli-decompressor@6.0.1
	bs58@0.5.1
	bumpalo@3.20.3
	bytemuck@1.25.2
	byteorder@1.5.0
	bytes@1.12.1
	bzip2@0.4.4
	bzip2@0.5.2
	bzip2-sys@0.1.13+1.0.8
	cairo-rs@0.18.5
	cairo-sys-rs@0.18.2
	camino@1.2.6
	cargo-platform@0.1.9
	cargo_metadata@0.19.2
	cargo_toml@1.0.1
	cbc@0.1.2
	cbc@0.2.1
	cc@1.5.1
	cesu8@1.1.0
	cfb@0.14.0
	cfg-expr@0.15.8
	cfg-if@1.0.5
	cfg_aliases@0.2.2
	chacha20@0.10.2
	chrono@0.4.45
	cipher@0.4.4
	cipher@0.5.2
	clipboard-win@5.4.1
	combine@4.6.8
	concurrent-queue@2.5.0
	const-oid@0.10.2
	constant_time_eq@0.3.1
	cookie@0.18.2
	core-foundation@0.10.1
	core-foundation-sys@0.8.7
	core-graphics@0.25.0
	core-graphics-types@0.2.0
	core_detect@1.0.0
	coreaudio-rs@0.14.2
	cpal@0.18.2
	cpubits@0.1.1
	cpufeatures@0.2.17
	cpufeatures@0.3.1
	crc@3.4.0
	crc-catalog@2.5.0
	crc32fast@1.5.2
	crossbeam-channel@0.5.17
	crossbeam-utils@0.8.23
	crypto-common@0.1.7
	crypto-common@0.2.2
	cssparser@0.37.0
	cssparser-macros@0.7.1
	ctor@1.0.13
	darling@0.24.1
	darling_core@0.24.1
	darling_macro@0.24.1
	dasp_sample@0.11.0
	data-encoding@2.11.1
	dbus@0.9.12
	dbus-secret-service@4.1.0
	deflate64@0.1.12
	defmt@1.1.1
	defmt-macros@1.1.1
	defmt-parser@1.0.0
	deranged@0.5.8
	derive_arbitrary@1.5.0
	derive_more@2.1.1
	derive_more-impl@2.1.1
	digest@0.10.7
	digest@0.11.3
	dirs@4.0.0
	dirs@7.0.0
	dirs-sys@0.3.7
	dirs-sys@0.5.0
	dispatch2@0.3.1
	displaydoc@0.2.7
	dlopen2@0.8.2
	dlopen2_derive@0.4.3
	dom_query@0.28.0
	downcast-rs@1.2.1
	dpi@0.1.2
	dtoa@1.0.11
	dtoa-short@0.3.5
	dunce@1.0.5
	dyn-clone@1.0.20
	ecb@0.2.1
	embed-resource@3.0.11
	embed_plist@1.2.2
	encoding_rs@0.8.43
	endi@1.1.1
	enum-primitive-derive@0.3.0
	enumflags2@0.7.12
	enumflags2_derive@0.7.12
	equivalent@1.0.2
	erased-serde@0.4.10
	errno@0.3.14
	error-code@3.4.0
	event-listener@5.4.2
	event-listener-strategy@0.5.4
	fastrand@2.5.0
	fdeflate@0.3.7
	field-offset@0.3.6
	filetime@0.2.29
	find-msvc-tools@0.1.14
	fixedbitset@0.5.7
	flate2@1.1.10
	flume@0.12.0
	fnv@1.0.7
	foldhash@0.1.5
	foldhash@0.2.0
	foreign-types@0.5.0
	foreign-types-macros@0.2.4
	foreign-types-shared@0.3.1
	form_urlencoded@1.2.2
	futures@0.3.34
	futures-channel@0.3.34
	futures-core@0.3.34
	futures-executor@0.3.34
	futures-io@0.3.34
	futures-lite@2.6.1
	futures-macro@0.3.34
	futures-sink@0.3.34
	futures-task@0.3.34
	futures-util@0.3.34
	gdk@0.18.2
	gdk-pixbuf@0.18.5
	gdk-pixbuf-sys@0.18.0
	gdk-sys@0.18.2
	gdkwayland-sys@0.18.2
	gdkx11@0.18.2
	gdkx11-sys@0.18.2
	generic-array@0.14.7
	gethostname@1.1.0
	getrandom@0.2.17
	getrandom@0.3.4
	getrandom@0.4.3
	gio@0.18.4
	gio-sys@0.18.1
	glib@0.18.5
	glib-macros@0.18.5
	glib-sys@0.18.1
	glob@0.3.4
	global-hotkey@0.8.0
	gobject-sys@0.18.0
	gtk@0.18.2
	gtk-sys@0.18.2
	gtk3-macros@0.18.2
	hashbrown@0.12.3
	hashbrown@0.15.5
	hashbrown@0.17.1
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.5.3
	hex@0.4.3
	hkdf@0.12.4
	hmac@0.12.1
	html5ever@0.39.0
	http@1.5.0
	http-body@1.1.0
	http-body-util@0.1.5
	httparse@1.10.1
	hybrid-array@0.4.15
	hyper@1.11.1
	hyper-rustls@0.27.10
	hyper-util@0.1.21
	iana-time-zone@0.1.65
	iana-time-zone-haiku@0.1.2
	ico@0.5.0
	icu_collections@2.3.0
	icu_locale_core@2.3.0
	icu_normalizer@2.3.0
	icu_normalizer_data@2.3.0
	icu_properties@2.3.0
	icu_properties_data@2.3.0
	icu_provider@2.3.1
	ident_case@1.0.1
	idna@1.1.0
	idna_adapter@1.2.2
	if-addrs@0.15.0
	indexmap@1.9.3
	indexmap@2.14.2
	infer@0.22.0
	inout@0.1.4
	inout@0.2.5
	ipnet@2.12.2
	itoa@1.0.18
	javascriptcore-rs@1.1.2
	javascriptcore-rs-sys@1.1.1
	jiff@0.2.37
	jiff-core@0.1.1
	jiff-static@0.2.37
	jiff-tzdb@0.1.8
	jiff-tzdb-platform@0.1.3
	jni@0.21.1
	jni@0.22.4
	jni-macros@0.22.4
	jni-sys@0.3.1
	jni-sys@0.4.1
	jni-sys-macros@0.4.1
	jobserver@0.1.35
	js-sys@0.3.106
	json-patch@4.2.0
	jsonptr@0.7.1
	keyboard-types@0.7.0
	keyboard-types@0.8.3
	keyring@3.6.3
	libappindicator@0.9.0
	libappindicator-sys@0.9.0
	libc@0.2.189
	libdbus-sys@0.2.7
	libloading@0.7.4
	libredox@0.1.25
	linux-raw-sys@0.12.1
	litemap@0.8.3
	lock_api@0.4.14
	log@0.4.34
	lopdf@0.46.0
	lru-slab@0.1.3
	lzma-rs@0.3.0
	lzma-sys@0.1.20
	mach2@0.6.0
	markup5ever@0.39.0
	md-5@0.11.0
	mdns-sd@0.21.5
	memchr@2.8.3
	memoffset@0.9.1
	mime@0.3.17
	miniz_oxide@0.8.9
	miniz_oxide@0.9.1
	mio@1.2.4
	muda@0.20.0
	multiversion_no_op@1.0.0
	ndk@0.9.0
	ndk-context@0.1.1
	ndk-sys@0.6.0+11769913
	new_debug_unreachable@1.0.6
	nix@0.29.0
	nom@8.0.0
	num@0.4.3
	num-bigint@0.4.8
	num-complex@0.4.6
	num-conv@0.2.2
	num-derive@0.4.2
	num-integer@0.1.47
	num-iter@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	num_enum@0.7.6
	num_enum_derive@0.7.6
	objc2@0.6.4
	objc2-app-kit@0.3.2
	objc2-audio-toolbox@0.3.2
	objc2-avf-audio@0.3.2
	objc2-cloud-kit@0.3.2
	objc2-core-audio@0.3.2
	objc2-core-audio-types@0.3.2
	objc2-core-data@0.3.2
	objc2-core-foundation@0.3.2
	objc2-core-graphics@0.3.2
	objc2-core-image@0.3.2
	objc2-core-location@0.3.2
	objc2-core-text@0.3.2
	objc2-encode@4.1.0
	objc2-exception-helper@0.1.1
	objc2-foundation@0.3.2
	objc2-io-surface@0.3.2
	objc2-quartz-core@0.3.2
	objc2-ui-kit@0.3.2
	objc2-user-notifications@0.3.2
	objc2-web-kit@0.3.2
	once_cell@1.21.4
	option-ext@0.2.0
	ordered-stream@0.2.0
	os_pipe@1.2.3
	pango@0.18.3
	pango-sys@0.18.0
	parking@2.2.1
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	pbkdf2@0.12.2
	percent-encoding@2.3.2
	petgraph@0.8.3
	phf@0.13.1
	phf_codegen@0.13.1
	phf_generator@0.13.1
	phf_macros@0.13.1
	phf_shared@0.13.1
	pin-project-lite@0.2.17
	piper@0.2.5
	pkg-config@0.3.34
	plist@1.10.1
	png@0.17.16
	png@0.18.1
	polling@3.11.0
	portable-atomic@1.15.0
	portable-atomic-util@0.2.8
	potential_utf@0.1.6
	powerfmt@0.2.0
	ppv-lite86@0.2.21
	precomputed-hash@0.1.1
	proc-macro-crate@1.3.1
	proc-macro-crate@2.0.2
	proc-macro-crate@3.5.0
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.107
	pulseaudio@0.3.1
	qrcode@0.14.1
	quick-xml@0.41.0
	quick-xml@0.42.0
	quinn@0.11.12
	quinn-proto@0.11.18
	quinn-udp@0.5.15
	quote@1.0.47
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.10.3
	rand@0.8.8
	rand@0.9.5
	rand_chacha@0.3.1
	rand_chacha@0.9.0
	rand_core@0.10.1
	rand_core@0.6.4
	rand_core@0.9.5
	rand_pcg@0.10.2
	rangemap@1.8.0
	raw-window-handle@0.6.2
	rcgen@0.13.2
	redox_syscall@0.5.18
	redox_users@0.4.6
	redox_users@0.5.3
	ref-cast@1.0.27
	ref-cast-impl@1.0.27
	regex@1.13.1
	regex-automata@0.4.18
	regex-syntax@0.8.11
	reqwest@0.12.28
	reqwest@0.13.5
	ring@0.17.14
	rustc-hash@2.1.3
	rustc_version@0.4.1
	rustix@1.1.5
	rustls@0.23.45
	rustls-pki-types@1.15.1
	rustls-webpki@0.103.15
	rustversion@1.0.23
	ryu@1.0.23
	same-file@1.0.6
	schemars@0.8.22
	schemars@0.9.0
	schemars@1.2.2
	schemars_derive@0.8.22
	scopeguard@1.2.0
	secret-service@4.0.0
	selectors@0.38.0
	semver@1.0.28
	serde@1.0.229
	serde-untagged@0.1.9
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_derive_internals@0.29.1
	serde_json@1.0.151
	serde_repr@0.1.21
	serde_spanned@0.6.9
	serde_spanned@1.1.1
	serde_urlencoded@0.7.1
	serde_with@3.24.0
	serde_with_macros@3.24.0
	serialize-to-javascript@0.1.2
	serialize-to-javascript-impl@0.1.2
	servo_arc@0.4.3
	sha1@0.10.7
	sha2@0.10.9
	sha2@0.11.1
	sherpa-onnx@1.13.8
	sherpa-onnx-sys@1.13.8
	shlex@2.0.1
	signal-hook-registry@1.4.8
	simd-adler32@0.3.10
	simd_cesu8@1.2.0
	simdutf8@0.1.5
	siphasher@1.0.4
	slab@0.4.12
	smallvec@1.16.2
	socket-pktinfo@0.4.1
	socket2@0.6.5
	softbuffer@0.4.8
	soup3@0.5.0
	soup3-sys@0.5.0
	spin@0.9.9
	stable_deref_trait@1.2.1
	static_assertions@1.1.0
	string_cache@0.9.0
	string_cache_codegen@0.6.1
	stringprep@0.1.5
	strsim@0.11.1
	subtle@2.6.1
	swift-rs@1.0.8
	syn@1.0.109
	syn@2.0.119
	syn@3.0.6
	sync_wrapper@1.0.2
	synstructure@0.14.0
	system-deps@6.2.2
	tao@0.37.1
	tao-macros@0.1.4
	tar@0.4.46
	target-lexicon@0.12.16
	tauri@2.12.0
	tauri-build@2.7.0
	tauri-codegen@2.7.0
	tauri-macros@2.7.0
	tauri-plugin@2.7.0
	tauri-plugin-autostart@2.6.0
	tauri-plugin-global-shortcut@2.4.0
	tauri-plugin-single-instance@2.5.0
	tauri-runtime@2.12.0
	tauri-runtime-wry@2.12.0
	tauri-utils@2.10.0
	tauri-winres@0.3.6
	tempfile@3.27.0
	tendril@0.5.1
	thiserror@1.0.69
	thiserror@2.0.21
	thiserror-impl@1.0.69
	thiserror-impl@2.0.21
	time@0.3.55
	time-core@0.1.9
	time-macros@0.2.32
	tinystr@0.8.4
	tinyvec@1.13.3
	tokio@1.53.1
	tokio-macros@2.7.2
	tokio-rustls@0.26.6
	tokio-tungstenite@0.26.2
	tokio-util@0.7.19
	toml@0.8.2
	toml@1.1.6+spec-1.1.0
	toml_datetime@0.6.3
	toml_datetime@1.1.1+spec-1.1.0
	toml_edit@0.19.15
	toml_edit@0.20.2
	toml_edit@0.25.15+spec-1.1.0
	toml_parser@1.1.3+spec-1.1.0
	toml_writer@1.1.2+spec-1.1.0
	tower@0.5.3
	tower-http@0.6.11
	tower-layer@0.3.3
	tower-service@0.3.3
	tracing@0.1.44
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tray-icon@0.25.1
	tree_magic_mini@3.2.2
	try-lock@0.2.5
	tungstenite@0.26.2
	typeid@1.0.3
	typenum@1.20.1
	uds_windows@1.2.1
	unicode-bidi@0.3.18
	unicode-ident@1.0.26
	unicode-normalization@0.1.26
	unicode-properties@0.1.4
	unicode-segmentation@1.13.3
	untrusted@0.9.0
	ureq@2.12.1
	url@2.5.8
	urlpattern@0.6.0
	utf-8@0.7.6
	utf8_iter@1.0.4
	uuid@1.26.1
	version-compare@0.2.1
	version_check@0.9.5
	vswhom@0.1.0
	vswhom-sys@0.1.3
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.4+wasi-0.2.12
	wasm-bindgen@0.2.129
	wasm-bindgen-futures@0.4.79
	wasm-bindgen-macro@0.2.129
	wasm-bindgen-macro-support@0.2.129
	wasm-bindgen-shared@0.2.129
	wasm-streams@0.5.0
	wayland-backend@0.3.17
	wayland-client@0.31.15
	wayland-protocols@0.32.13
	wayland-protocols-wlr@0.3.12
	wayland-scanner@0.31.11
	wayland-sys@0.31.11
	web-sys@0.3.106
	web-time@1.1.0
	web_atoms@0.2.6
	webkit2gtk@2.0.2
	webkit2gtk-sys@2.0.2
	webpki-roots@0.26.11
	webpki-roots@1.0.9
	webview2-com@0.39.1
	webview2-com-macros@0.8.1
	webview2-com-sys@0.39.1
	weezl@0.2.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	window-vibrancy@0.8.1
	windows@0.61.3
	windows@0.62.2
	windows-collections@0.2.0
	windows-collections@0.3.2
	windows-core@0.61.2
	windows-core@0.62.2
	windows-future@0.2.1
	windows-future@0.3.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.1.3
	windows-link@0.2.1
	windows-numerics@0.2.0
	windows-numerics@0.3.1
	windows-result@0.3.4
	windows-result@0.4.1
	windows-strings@0.4.2
	windows-strings@0.5.1
	windows-sys@0.45.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.42.2
	windows-targets@0.52.6
	windows-targets@0.53.5
	windows-threading@0.1.0
	windows-threading@0.2.1
	windows-version@0.1.7
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.1
	winnow@0.5.40
	winnow@1.0.4
	winreg@0.10.1
	winreg@0.55.0
	wit-bindgen@0.57.1
	wl-clipboard-rs@0.9.4
	writeable@0.6.4
	wry@0.57.0
	x11@2.21.0
	x11-dl@2.21.0
	x11rb@0.13.2
	x11rb-protocol@0.13.2
	xattr@1.6.1
	xdg-home@1.3.0
	xkeysym@0.2.1
	xz2@0.1.7
	yasna@0.5.2
	yoke@0.8.3
	yoke-derive@0.8.3
	zbus@4.4.0
	zbus@5.19.0
	zbus_macros@4.4.0
	zbus_macros@5.19.0
	zbus_names@3.0.0
	zbus_names@4.3.4
	zcheapstr@1.1.0
	zerocopy@0.8.59
	zerocopy-derive@0.8.59
	zerofrom@0.1.8
	zerofrom-derive@0.1.8
	zeroize@1.9.0
	zeroize_derive@1.5.0
	zerotrie@0.2.5
	zerovec@0.11.8
	zerovec-derive@0.11.6
	zip@2.4.2
	zlib-rs@0.6.8
	zmij@1.0.23
	zopfli@0.8.4
	zstd@0.13.3
	zstd-safe@7.3.0
	zstd-sys@2.1.1+zstd.1.5.7
	zvariant@4.2.0
	zvariant@5.15.0
	zvariant_derive@4.2.0
	zvariant_derive@5.15.0
	zvariant_utils@2.1.0
	zvariant_utils@4.2.0
"

inherit cargo desktop

COMMIT=74363634b037108393e450428e5f207515c2c29b
SHERPA_VERSION=1.13.8
SHERPA_ARCHIVE="sherpa-onnx-v${SHERPA_VERSION}-linux-x64-static-lib"
DESCRIPTION="Desktop companion for coding agent sessions"
HOMEPAGE="https://github.com/Louis-CFM/coucou"
SRC_URI="
	https://github.com/Louis-CFM/coucou/archive/${COMMIT}.tar.gz -> ${PN}-${COMMIT}.tar.gz
	https://github.com/k2-fsa/sherpa-onnx/releases/download/v${SHERPA_VERSION}/${SHERPA_ARCHIVE}.tar.bz2
	${CARGO_CRATE_URIS}
	https://registry.npmjs.org/@esbuild/openharmony-arm64/-/openharmony-arm64-0.25.12.tgz
		-> coucou-npm-014c2a8a24025d2ddb17.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-ppc64-musl/-/rollup-linux-ppc64-musl-4.63.5.tgz
		-> coucou-npm-02ffc37f825dcd09f749.tgz
	https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.25.12.tgz
		-> coucou-npm-0466e61b16fcd188fb19.tgz
	https://registry.npmjs.org/@esbuild/freebsd-x64/-/freebsd-x64-0.25.12.tgz
		-> coucou-npm-0581a0cb9a44234185d5.tgz
	https://registry.npmjs.org/@rollup/rollup-win32-x64-gnu/-/rollup-win32-x64-gnu-4.63.5.tgz
		-> coucou-npm-0585ce599ee9b35c68d3.tgz
	https://registry.npmjs.org/@rollup/rollup-openharmony-arm64/-/rollup-openharmony-arm64-4.63.5.tgz
		-> coucou-npm-097e9e58826de9a100e1.tgz
	https://registry.npmjs.org/@esbuild/aix-ppc64/-/aix-ppc64-0.25.12.tgz
		-> coucou-npm-0d5187c32cde6c7c87ad.tgz
	https://registry.npmjs.org/@tauri-apps/cli-darwin-arm64/-/cli-darwin-arm64-2.12.0.tgz
		-> coucou-npm-0fe834ecc7f9cdf6c4d3.tgz
	https://registry.npmjs.org/picocolors/-/picocolors-1.1.1.tgz
		-> coucou-npm-1aabc8b6282461d4c675.tgz
	https://registry.npmjs.org/esbuild/-/esbuild-0.25.12.tgz
		-> coucou-npm-1d77eb92512445f2100e.tgz
	https://registry.npmjs.org/@tauri-apps/cli/-/cli-2.12.0.tgz
		-> coucou-npm-2267f60bd7bb7fd949b1.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-riscv64-gnu/-/rollup-linux-riscv64-gnu-4.63.5.tgz
		-> coucou-npm-24412740187d8ed6a8de.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-arm-musleabihf/-/rollup-linux-arm-musleabihf-4.63.5.tgz
		-> coucou-npm-2459c106d98c962608da.tgz
	https://registry.npmjs.org/@tauri-apps/cli-linux-arm64-musl/-/cli-linux-arm64-musl-2.12.0.tgz
		-> coucou-npm-24e397ac7c3586c0e360.tgz
	https://registry.npmjs.org/@esbuild/netbsd-x64/-/netbsd-x64-0.25.12.tgz
		-> coucou-npm-28b219594515fce3b3c7.tgz
	https://registry.npmjs.org/@rollup/rollup-freebsd-arm64/-/rollup-freebsd-arm64-4.63.5.tgz
		-> coucou-npm-2ffd1221764b26a8e173.tgz
	https://registry.npmjs.org/@esbuild/netbsd-arm64/-/netbsd-arm64-0.25.12.tgz
		-> coucou-npm-3ce73223735050343f3b.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-x64-musl/-/rollup-linux-x64-musl-4.63.5.tgz
		-> coucou-npm-3cea8a119b01b67e6b45.tgz
	https://registry.npmjs.org/@rollup/rollup-win32-ia32-msvc/-/rollup-win32-ia32-msvc-4.63.5.tgz
		-> coucou-npm-3edf4cacc11fd122b04f.tgz
	https://registry.npmjs.org/@esbuild/android-arm64/-/android-arm64-0.25.12.tgz
		-> coucou-npm-418e638f0e19925f8e92.tgz
	https://registry.npmjs.org/@tauri-apps/cli-darwin-x64/-/cli-darwin-x64-2.12.0.tgz
		-> coucou-npm-42ab5b91c4388ca8d837.tgz
	https://registry.npmjs.org/@tauri-apps/cli-win32-x64-msvc/-/cli-win32-x64-msvc-2.12.0.tgz
		-> coucou-npm-452dd3cd445b6b501df3.tgz
	https://registry.npmjs.org/@tauri-apps/cli-win32-arm64-msvc/-/cli-win32-arm64-msvc-2.12.0.tgz
		-> coucou-npm-4666fac294ad893dfe8a.tgz
	https://registry.npmjs.org/@rollup/rollup-darwin-x64/-/rollup-darwin-x64-4.63.5.tgz
		-> coucou-npm-469b9364811c1274c9c7.tgz
	https://registry.npmjs.org/@esbuild/darwin-arm64/-/darwin-arm64-0.25.12.tgz
		-> coucou-npm-5425e65d3ae34b170d2e.tgz
	https://registry.npmjs.org/tinyglobby/-/tinyglobby-0.2.17.tgz
		-> coucou-npm-58e91972fa4b4a3d8929.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-s390x-gnu/-/rollup-linux-s390x-gnu-4.63.5.tgz
		-> coucou-npm-5fa9beeb9708dac992e0.tgz
	https://registry.npmjs.org/@esbuild/freebsd-arm64/-/freebsd-arm64-0.25.12.tgz
		-> coucou-npm-60194e76195f71f919bd.tgz
	https://registry.npmjs.org/@tauri-apps/cli-linux-riscv64-gnu/-/cli-linux-riscv64-gnu-2.12.0.tgz
		-> coucou-npm-64f83920ac06342592a1.tgz
	https://registry.npmjs.org/@esbuild/android-x64/-/android-x64-0.25.12.tgz
		-> coucou-npm-6858a8c418bea72e40bd.tgz
	https://registry.npmjs.org/nanoid/-/nanoid-3.3.19.tgz
		-> coucou-npm-6b582be69e0d186a0857.tgz
	https://registry.npmjs.org/@tauri-apps/cli-linux-arm-gnueabihf/-/cli-linux-arm-gnueabihf-2.12.0.tgz
		-> coucou-npm-6be04a7bb21f35d2aed1.tgz
	https://registry.npmjs.org/@esbuild/linux-s390x/-/linux-s390x-0.25.12.tgz
		-> coucou-npm-6d4545f9be0f999ba2dd.tgz
	https://registry.npmjs.org/@rollup/rollup-openbsd-x64/-/rollup-openbsd-x64-4.63.5.tgz
		-> coucou-npm-6fc3fab4db2b2db8126b.tgz
	https://registry.npmjs.org/@esbuild/linux-loong64/-/linux-loong64-0.25.12.tgz
		-> coucou-npm-706edcfef6df173ef0fe.tgz
	https://registry.npmjs.org/rollup/-/rollup-4.63.5.tgz
		-> coucou-npm-72961e4d3e4080919991.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-arm-gnueabihf/-/rollup-linux-arm-gnueabihf-4.63.5.tgz
		-> coucou-npm-733bd9339992ffd7358c.tgz
	https://registry.npmjs.org/@tauri-apps/cli-linux-x64-gnu/-/cli-linux-x64-gnu-2.12.0.tgz
		-> coucou-npm-734215d7cf4adf6a7a87.tgz
	https://registry.npmjs.org/@esbuild/win32-ia32/-/win32-ia32-0.25.12.tgz
		-> coucou-npm-7508e8bd7c2627436928.tgz
	https://registry.npmjs.org/@types/estree/-/estree-1.0.9.tgz
		-> coucou-npm-7e8339d3880aa72de15d.tgz
	https://registry.npmjs.org/vite/-/vite-6.4.3.tgz
		-> coucou-npm-83a37215e2842836b81a.tgz
	https://registry.npmjs.org/@rollup/rollup-win32-x64-msvc/-/rollup-win32-x64-msvc-4.63.5.tgz
		-> coucou-npm-877971ad5c3df8de9451.tgz
	https://registry.npmjs.org/@rollup/rollup-freebsd-x64/-/rollup-freebsd-x64-4.63.5.tgz
		-> coucou-npm-87d1351d329e50f9458b.tgz
	https://registry.npmjs.org/@esbuild/linux-riscv64/-/linux-riscv64-0.25.12.tgz
		-> coucou-npm-8c4bdf7e076fa6b03b91.tgz
	https://registry.npmjs.org/@napi-rs/lzma-linux-x64-gnu/-/lzma-linux-x64-gnu-1.5.1.tgz
		-> coucou-npm-8dfd61f86d067f733aca.tgz
	https://registry.npmjs.org/@rollup/rollup-darwin-arm64/-/rollup-darwin-arm64-4.63.5.tgz
		-> coucou-npm-90a66e84274938f5e173.tgz
	https://registry.npmjs.org/@rollup/rollup-android-arm-eabi/-/rollup-android-arm-eabi-4.63.5.tgz
		-> coucou-npm-90a80e8d34931c832065.tgz
	https://registry.npmjs.org/@esbuild/sunos-x64/-/sunos-x64-0.25.12.tgz
		-> coucou-npm-90cad593dc6ad216498a.tgz
	https://registry.npmjs.org/@esbuild/win32-arm64/-/win32-arm64-0.25.12.tgz
		-> coucou-npm-94cd9ee9a142d2a33c9f.tgz
	https://registry.npmjs.org/@esbuild/linux-mips64el/-/linux-mips64el-0.25.12.tgz
		-> coucou-npm-9cb31778eaf46b8070b8.tgz
	https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.25.12.tgz
		-> coucou-npm-a26a5799f0204f7d2f10.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-ppc64-gnu/-/rollup-linux-ppc64-gnu-4.63.5.tgz
		-> coucou-npm-a35667849b3863859b7b.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-riscv64-musl/-/rollup-linux-riscv64-musl-4.63.5.tgz
		-> coucou-npm-a5ef5dcf26bf8e5644f3.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-arm64-gnu/-/rollup-linux-arm64-gnu-4.63.5.tgz
		-> coucou-npm-b1b5bee94b52d78ca067.tgz
	https://registry.npmjs.org/fdir/-/fdir-6.5.0.tgz
		-> coucou-npm-b2caafa9a386895c63b4.tgz
	https://registry.npmjs.org/@rollup/rollup-android-arm64/-/rollup-android-arm64-4.63.5.tgz
		-> coucou-npm-b33d847254e39b0d3dec.tgz
	https://registry.npmjs.org/picomatch/-/picomatch-4.0.7.tgz
		-> coucou-npm-b8323ad9ab18da4a0d43.tgz
	https://registry.npmjs.org/@tauri-apps/cli-linux-arm64-gnu/-/cli-linux-arm64-gnu-2.12.0.tgz
		-> coucou-npm-baa93a2088941fccceec.tgz
	https://registry.npmjs.org/typescript/-/typescript-5.9.3.tgz
		-> coucou-npm-c031722b962ec9c5fa04.tgz
	https://registry.npmjs.org/@esbuild/openbsd-arm64/-/openbsd-arm64-0.25.12.tgz
		-> coucou-npm-c331de7236052c082367.tgz
	https://registry.npmjs.org/source-map-js/-/source-map-js-1.2.2.tgz
		-> coucou-npm-c3ce90365059397e785a.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-arm64-musl/-/rollup-linux-arm64-musl-4.63.5.tgz
		-> coucou-npm-c4bfeccb6f32e2f8b1f9.tgz
	https://registry.npmjs.org/@esbuild/linux-ia32/-/linux-ia32-0.25.12.tgz
		-> coucou-npm-c5c8114d255a3957546e.tgz
	https://registry.npmjs.org/@esbuild/linux-ppc64/-/linux-ppc64-0.25.12.tgz
		-> coucou-npm-caaad54dc7841bd04548.tgz
	https://registry.npmjs.org/@esbuild/android-arm/-/android-arm-0.25.12.tgz
		-> coucou-npm-d061b15ad95366da2aac.tgz
	https://registry.npmjs.org/@tauri-apps/api/-/api-2.12.0.tgz
		-> coucou-npm-d1282d4c824670177f21.tgz
	https://registry.npmjs.org/postcss/-/postcss-8.5.28.tgz
		-> coucou-npm-d32189906b1a050d76d0.tgz
	https://registry.npmjs.org/@tauri-apps/cli-win32-ia32-msvc/-/cli-win32-ia32-msvc-2.12.0.tgz
		-> coucou-npm-d6b97b5fa23aaa4319c6.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-loong64-musl/-/rollup-linux-loong64-musl-4.63.5.tgz
		-> coucou-npm-d9de7826237599b6e9b7.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-loong64-gnu/-/rollup-linux-loong64-gnu-4.63.5.tgz
		-> coucou-npm-db90de32860d1199b877.tgz
	https://registry.npmjs.org/fsevents/-/fsevents-2.3.3.tgz
		-> coucou-npm-dd9c799f4afd7351ba06.tgz
	https://registry.npmjs.org/@esbuild/openbsd-x64/-/openbsd-x64-0.25.12.tgz
		-> coucou-npm-dff9f5cf74f7d8c800c7.tgz
	https://registry.npmjs.org/@rollup/rollup-win32-arm64-msvc/-/rollup-win32-arm64-msvc-4.63.5.tgz
		-> coucou-npm-e767d0e48bb49a90cce3.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-x64-gnu/-/rollup-linux-x64-gnu-4.63.5.tgz
		-> coucou-npm-eab08ea1d22dbfd052a9.tgz
	https://registry.npmjs.org/@esbuild/linux-arm/-/linux-arm-0.25.12.tgz
		-> coucou-npm-eeeb20db329535edb42e.tgz
	https://registry.npmjs.org/@tauri-apps/cli-linux-x64-musl/-/cli-linux-x64-musl-2.12.0.tgz
		-> coucou-npm-f32f3dc96b28ad3b93d5.tgz
	https://registry.npmjs.org/@esbuild/darwin-x64/-/darwin-x64-0.25.12.tgz
		-> coucou-npm-f7ae2f5157ec1527efa4.tgz
	https://registry.npmjs.org/@esbuild/win32-x64/-/win32-x64-0.25.12.tgz
		-> coucou-npm-f8cb6531d3d74a5f1b73.tgz
"

S="${WORKDIR}/${PN}-${COMMIT}"
LICENSE="MIT coucou-assets GPL-3+ Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CDLA-Permissive-2.0 ISC MPL-2.0 Unicode-3.0 ZLIB"
SLOT="0"
KEYWORDS="~amd64"
# Several upstream tests start local network services; Portage test sandboxes may not permit them.
RESTRICT="mirror bindist test"

RDEPEND="
	dev-libs/glib:2
	dev-libs/libayatana-appindicator
	gui-libs/gtk-layer-shell
	media-libs/alsa-lib
	media-libs/gst-plugins-base
	media-libs/gst-plugins-good
	net-libs/webkit-gtk:4.1[gstreamer]
	sys-apps/dbus
	x11-libs/gtk+:3
	x11-misc/xdg-utils
	x11-themes/hicolor-icon-theme
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/pkgconf
	>=net-libs/nodejs-20[npm]
"

src_unpack() {
	unpack "${PN}-${COMMIT}.tar.gz" "${SHERPA_ARCHIVE}.tar.bz2"
	cargo_crate_unpack
	cargo_gen_config
}

src_prepare() {
	default
	cd windows || die
	export npm_config_cache="${T}/npm-cache"
	local archive
	local -a npm_archives=()
	for archive in ${A}; do
		[[ ${archive} == coucou-npm-*.tgz ]] && npm_archives+=( "${DISTDIR}/${archive}" )
	done
	[[ ${#npm_archives[@]} -eq 78 ]] || die "Expected 78 npm archives"
	npm cache add --offline "${npm_archives[@]}" || die
	npm ci --offline --ignore-scripts --no-audit --no-fund || die
}

src_compile() {
	cd windows || die
	export SHERPA_ONNX_LIB_DIR="${WORKDIR}/${SHERPA_ARCHIVE}/lib"
	./node_modules/.bin/tsc --noEmit || die
	./node_modules/.bin/vite build || die
	cargo_env cargo build --frozen --release -p coucou-hook || die
	cargo_env cargo build --frozen --release -p coucou --bin coucou --features tauri/custom-protocol || die
}

src_install() {
	cd windows || die
	local target="$(cargo_target_dir)"
	target="${target%/*}/release"
	dobin "${target}/coucou" "${target}/coucou-hook"
	newmenu ../linux/arch/coucou.desktop fr.louisraille.coucou.desktop
	newicon -s 32 src-tauri/icons/32x32.png coucou.png
	newicon -s 128 src-tauri/icons/128x128.png coucou.png
	newicon -s 256 src-tauri/icons/128x128@2x.png coucou.png
	dodoc ../LICENSE ../LICENSE-ASSETS.md
}
