<script>
  import {onMount} from 'svelte';

  let state = 'menu';
  let sidebar;

  onMount(() => {
    sidebar = document.getElementById('sidebar');

    const astroHandler = () => collapseSidebar();
    document.addEventListener('astro:after-swap', astroHandler);

    return () => {
      document.removeEventListener('astro:after-swap', astroHandler);
    };
  });

  function toggleSidebar() {
    if (state === 'menu') {
    expandSidebar();
  } else {
    collapseSidebar();
  }
  }

  function expandSidebar() {
    state = state === 'menu' ? 'close' : 'menu';
    if (sidebar) {
      sidebar.style.left = '0px';
      sidebar.style.transition = '800ms cubic-bezier(0.22, 1, 0.36, 1)';
    }
  }

  function collapseSidebar() {
    state = state === 'menu' ? 'close' : 'menu';
    if (sidebar) {
      sidebar.style.left = sidebar.style.width;
      sidebar.style.transition = '800ms cubic-bezier(0.83, 0, 0.17, 1)';
    }
  }
</script>

<button
    class="material-symbols-rounded w-auto h-full aspect-square text-white hover:bg-spacegamedev-primary duration-300 bg-transparent select-none hover:ring-4 hover:ring-spacegamedev-primary/50 cursor-pointer border-r border-white/10"
    title="Toggle Sidebar"
    on:click={toggleSidebar}
    id="material-icon"
>
  {state}
</button>