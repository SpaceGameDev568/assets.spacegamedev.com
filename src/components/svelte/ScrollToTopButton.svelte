<script>
	function ScrollToTop() {
		window.scrollTo({left: 0, top: 0, behavior: "smooth"})
	}
</script>

<button
		class="material-symbols-rounded text-white hover:bg-spacegamedev-primary duration-300 select-none hover:ring-4 hover:ring-spacegamedev-primary/50 cursor-pointer border border-white/10 bottom-5 right-5 p-5 fixed bg-background-primary/50 backdrop-blur-xs z-50"
		title="Scroll To Top"
		on:click={ScrollToTop}
		id={"material-icon"}>keyboard_double_arrow_up</button>