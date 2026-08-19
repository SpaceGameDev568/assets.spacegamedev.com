<script>
	function ScrollToTop() {
		window.scrollTo({left: 0, top: 0, behavior: "smooth"})
	}
</script>

<button
		class="text-white hover:bg-spacegamedev-primary duration-300 select-none hover:ring-4 hover:ring-spacegamedev-primary/50 cursor-pointer border border-white/10 bottom-5 right-5 p-5 fixed bg-background-primary/50 backdrop-blur-xs z-50"
		title="Scroll To Top"
		on:click={ScrollToTop}>

<img
		src="/images/MaterialIcons/keyboard_double_arrow_up_24dp_FFFFFF_FILL1_wght400_GRAD0_opsz24.svg"
		alt="Scroll to Top"
		width="28"
		height="28"
		class="w-7 h-7"
/></button>