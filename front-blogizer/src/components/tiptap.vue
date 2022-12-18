<template>
  <div v-if="editor" class="flex flex-row flex-wrap content-between md:h-16 gap-1">
    <div @click="editor.chain().focus().toggleBold().run()" :class="`${ editor.isActive('bold') ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 focus:outline-none shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M8 11h4.5a2.5 2.5 0 1 0 0-5H8v5zm10 4.5a4.5 4.5 0 0 1-4.5 4.5H6V4h6.5a4.5 4.5 0 0 1 3.256 7.606A4.498 4.498 0 0 1 18 15.5zM8 13v5h5.5a2.5 2.5 0 1 0 0-5H8z"/></svg>
    </div>
    <div @click="editor.chain().focus().toggleItalic().run()" :class="`${ editor.isActive('italic') ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M15 20H7v-2h2.927l2.116-12H9V4h8v2h-2.927l-2.116 12H15z"/></svg>
    </div>
    <div @click="editor.chain().focus().toggleUnderline().run()" :class="`${ editor.isActive('underline') ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M8 3v9a4 4 0 1 0 8 0V3h2v9a6 6 0 1 1-12 0V3h2zM4 20h16v2H4v-2z"/></svg>
    </div>
    <div @click="editor.chain().focus().toggleStrike().run()" :class="`${ editor.isActive('strike') ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M17.154 14c.23.516.346 1.09.346 1.72 0 1.342-.524 2.392-1.571 3.147C14.88 19.622 13.433 20 11.586 20c-1.64 0-3.263-.381-4.87-1.144V16.6c1.52.877 3.075 1.316 4.666 1.316 2.551 0 3.83-.732 3.839-2.197a2.21 2.21 0 0 0-.648-1.603l-.12-.117H3v-2h18v2h-3.846zm-4.078-3H7.629a4.086 4.086 0 0 1-.481-.522C6.716 9.92 6.5 9.246 6.5 8.452c0-1.236.466-2.287 1.397-3.153C8.83 4.433 10.271 4 12.222 4c1.471 0 2.879.328 4.222.984v2.152c-1.2-.687-2.515-1.03-3.946-1.03-2.48 0-3.719.782-3.719 2.346 0 .42.218.786.654 1.099.436.313.974.562 1.613.75.62.18 1.297.414 2.03.699z"/></svg>
    </div>
    <div @click="editor.chain().focus().setHeading({ level: 1 }).run()" :class="`${ editor.isActive('heading', { level: 1 }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0H24V24H0z"/><path d="M13 20h-2v-7H4v7H2V4h2v7h7V4h2v16zm8-12v12h-2v-9.796l-2 .536V8.67L19.5 8H21z"/></svg>
    </div>
    <div @click="editor.chain().focus().setHeading({ level: 2 }).run()" :class="`${ editor.isActive('heading', { level: 2 }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0H24V24H0z"/><path d="M4 4v7h7V4h2v16h-2v-7H4v7H2V4h2zm14.5 4c2.071 0 3.75 1.679 3.75 3.75 0 .857-.288 1.648-.772 2.28l-.148.18L18.034 18H22v2h-7v-1.556l4.82-5.546c.268-.307.43-.709.43-1.148 0-.966-.784-1.75-1.75-1.75-.918 0-1.671.707-1.744 1.606l-.006.144h-2C14.75 9.679 16.429 8 18.5 8z"/></svg></div>
    <div @click="editor.chain().focus().setHeading({ level: 3 }).run()" :class="`${ editor.isActive('heading', { level: 3 }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0H24V24H0z"/><path d="M22 8l-.002 2-2.505 2.883c1.59.435 2.757 1.89 2.757 3.617 0 2.071-1.679 3.75-3.75 3.75-1.826 0-3.347-1.305-3.682-3.033l1.964-.382c.156.806.866 1.415 1.718 1.415.966 0 1.75-.784 1.75-1.75s-.784-1.75-1.75-1.75c-.286 0-.556.069-.794.19l-1.307-1.547L19.35 10H15V8h7zM4 4v7h7V4h2v16h-2v-7H4v7H2V4h2z"/></svg>
    </div>
    <div @click="editor.chain().focus().setHeading({ level: 4 }).run()" :class="`${ editor.isActive('heading', { level: 4 }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0H24V24H0z"/><path d="M13 20h-2v-7H4v7H2V4h2v7h7V4h2v16zm9-12v8h1.5v2H22v2h-2v-2h-5.5v-1.34l5-8.66H22zm-2 3.133L17.19 16H20v-4.867z"/></svg>
    </div>
    <div @click="editor.chain().focus().setHeading({ level: 5 }).run()" :class="`${ editor.isActive('heading', { level: 5 }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0H24V24H0z"/><path d="M22 8v2h-4.323l-.464 2.636c.33-.089.678-.136 1.037-.136 2.21 0 4 1.79 4 4s-1.79 4-4 4c-1.827 0-3.367-1.224-3.846-2.897l1.923-.551c.24.836 1.01 1.448 1.923 1.448 1.105 0 2-.895 2-2s-.895-2-2-2c-.63 0-1.193.292-1.56.748l-1.81-.904L16 8h6zM4 4v7h7V4h2v16h-2v-7H4v7H2V4h2z"/></svg>
    </div>
    <div @click="editor.chain().focus().setHeading({ level: 6 }).run()" :class="`${ editor.isActive('heading', { level: 6 }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0H24V24H0z"/><path d="M21.097 8l-2.598 4.5c2.21 0 4.001 1.79 4.001 4s-1.79 4-4 4-4-1.79-4-4c0-.736.199-1.426.546-2.019L18.788 8h2.309zM4 4v7h7V4h2v16h-2v-7H4v7H2V4h2zm14.5 10.5c-1.105 0-2 .895-2 2s.895 2 2 2 2-.895 2-2-.895-2-2-2z"/></svg>
    </div>
    <div @click="editor.chain().focus().setParagraph().run()" :class="`${ editor.isActive('paragraph') ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 6v15h-2v-5a6 6 0 1 1 0-12h10v2h-3v15h-2V6h-3zm-2 0a4 4 0 1 0 0 8V6z"/></svg>
    </div>
    <div @click="editor.chain().focus().setTextAlign('left').run()" :class="`${ editor.isActive({ textAlign: 'left' }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M3 4h18v2H3V4zm0 15h14v2H3v-2zm0-5h18v2H3v-2zm0-5h14v2H3V9z"/></svg>
    </div>
    <div @click="editor.chain().focus().setTextAlign('center').run()"  :class="`${ editor.isActive({ textAlign: 'center' }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M3 4h18v2H3V4zm2 15h14v2H5v-2zm-2-5h18v2H3v-2zm2-5h14v2H5V9z"/></svg>
    </div>
    <div @click="editor.chain().focus().setTextAlign('right').run()"  :class="`${ editor.isActive({ textAlign: 'right' }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M3 4h18v2H3V4zm4 15h14v2H7v-2zm-4-5h18v2H3v-2zm4-5h14v2H7V9z"/></svg>
    </div>
    <div @click="editor.chain().focus().setTextAlign('justify').run()"  :class="`${ editor.isActive({ textAlign: 'justify' }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M3 4h18v2H3V4zm0 15h18v2H3v-2zm0-5h18v2H3v-2zm0-5h18v2H3V9z"/></svg>
    </div>
     <div>
      <div class="relative select-none" style="z-index: 2;">
            <div @click="openDropdown"  class="relative bg-white text-green-500 cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center" :style="{'color': editor.getAttributes('textStyle').color }">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M15.246 14H8.754l-1.6 4H5l6-15h2l6 15h-2.154l-1.6-4zm-.8-2L12 5.885 9.554 12h4.892zM3 20h18v2H3v-2z"/></svg>
            </div>
            <div class="dropdown hidden absolute top-12">
              <div class="shadow-lg border border-gray-300 w-40 flex justify-center flex-wrap p-1.5 py-1.5 bg-gray-200 rounded overflow-hidden">
                <div class="w-full text-xs text-gray-600 font-bold mb-1">Font Color</div>
                <div v-for="(pick, index) in pickColors" :key="index" :class="`${pick.bg} w-6 h-5`" @click="changeColor(pick.color)"></div>
              </div>
            </div>
          </div>
    </div>
    <div @click="editor.chain().focus().toggleCodeBlock().run()" :class="`${ editor.isActive('codeBlock') ?  'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16.95 8.464l1.414-1.414 4.95 4.95-4.95 4.95-1.414-1.414L20.485 12 16.95 8.464zm-9.9 0L3.515 12l3.535 3.536-1.414 1.414L.686 12l4.95-4.95L7.05 8.464z"/></svg>
    </div>
    <div @click="editor.chain().focus().toggleBulletList().run()"  :class="`${ editor.isActive('bulletList') ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M8 4h13v2H8V4zM5 3v3h1v1H3V6h1V4H3V3h2zM3 14v-2.5h2V11H3v-1h3v2.5H4v.5h2v1H3zm2 5.5H3v-1h2V18H3v-1h3v4H3v-1h2v-.5zM8 11h13v2H8v-2zm0 7h13v2H8v-2z"/></svg>
    </div>
    <div @click="editor.chain().focus().toggleOrderedList().run()"  :class="`${ editor.isActive('orderedList') ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M8 4h13v2H8V4zM4.5 6.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 7a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm0 6.9a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zM8 11h13v2H8v-2zm0 7h13v2H8v-2z"/></svg>
    </div>
    <div @click="addImage" class="bg-white text-green-500 cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M4.828 21l-.02.02-.021-.02H2.992A.993.993 0 0 1 2 20.007V3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H4.828zM20 15V5H4v14L14 9l6 6zm0 2.828l-6-6L6.828 19H20v-1.172zM8 11a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"/></svg>
    </div>
    <!-- <div @click="editor.chain().focus().setTextAlign('justify').run()"  :class="`${ editor.isActive({ textAlign: 'justify' }) ? 'bg-green-500 text-white' : 'bg-white text-green-500'} cursor-pointer px-2.5 py-1.5 shadow-sm hover:shadow-md transition duration-300 ease rounded-sm flex justify-center items-center`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M18.364 15.536L16.95 14.12l1.414-1.414a5 5 0 1 0-7.071-7.071L9.879 7.05 8.464 5.636 9.88 4.222a7 7 0 0 1 9.9 9.9l-1.415 1.414zm-2.828 2.828l-1.415 1.414a7 7 0 0 1-9.9-9.9l1.415-1.414L7.05 9.88l-1.414 1.414a5 5 0 1 0 7.071 7.071l1.414-1.414 1.415 1.414zm-.708-10.607l1.415 1.415-7.071 7.07-1.415-1.414 7.071-7.07z"/></svg>
    </div> -->
  </div>
  <div class="shadow-sm rounded mt-4 bg-white">
    <editor-content :editor="editor"></editor-content>
  </div>
</template>
<script>
import { Editor, EditorContent } from "@tiptap/vue-3";
import StarterKit from "@tiptap/starter-kit";
import TextAlign from "@tiptap/extension-text-align";
import TextStyle from "@tiptap/extension-text-style";
import Image from "@tiptap/extension-image";
import Color from "@tiptap/extension-color";
import Underline from "@tiptap/extension-underline";
import { ref } from '@vue/reactivity';
import { onMounted } from '@vue/runtime-core';
export default {
    components: {
        EditorContent
    },
    props: ['content'],
    setup(props, context) {
      const editor = ref(null);
      onMounted(()=>{
        editor.value = new Editor({
        content: props.content,
        parseOptions: {
          preserveWhitespace: true
        },
        extensions: [
          StarterKit,
          TextAlign.configure({
            types: ['heading', 'paragraph']
          }),
          TextStyle,
          Image,
          Color,
          Underline,
        ],
        onUpdate: ()=>{
            context.emit('update:content', editor.value.getHTML())
          }
        })
      })

    const openDropdown = ()=>{
      const dropdown = document.querySelector('.dropdown')
      dropdown.classList.toggle('open')
    }

    const changeColor = color => {
      editor.value.chain().focus().setColor(color).run()
      openDropdown()
    }
    const pickColors = ref([
      {
        bg: 'bg-gray-300',
        color: '#d1d5db'
      },
      {
        bg: 'bg-gray-400',
        color: '#94a3b8'
      },
      {
        bg: 'bg-gray-500',
        color: '#64748b'
      },
      {
        bg: 'bg-gray-600',
        color: '#475569'
      },
      {
        bg: 'bg-indigo-400',
        color: '#818cf8'
      },
      {
        bg: 'bg-green-400',
        color: '#4ade80'
      },
      {
        bg: 'bg-green-500',
        color: '#22c55e'
      },
      {
        bg: 'bg-yellow-400',
        color: '#facc15'
      },
      {
        bg: 'bg-blue-500',
        color: '#3b82f6'
      },
      {
        bg: 'bg-red-500',
        color: '#f43f5e'
      },
      {
        bg: 'bg-white',
        color: '#ffffff'
      },
      {
        bg: 'bg-black',
        color: '#000000'
      }
    ])
    const addImage = ()=>{
      const url = window.prompt('URL')
      if (url) {
        editor.value.chain().focus().setImage({src: url}).run()
      }
    }
    return { editor, openDropdown, changeColor, pickColors, addImage }
    },
}
</script>

<style>
.ProseMirror {
  min-height: 9em;
  padding: 0.65em;
  z-index: 0;
}

.ProseMirror img {
  border-radius: 0.125rem;
}

.ProseMirror:focus {
  outline: none;
}

@keyframes fade{
  0% {
    transform: translateY(-8px);
    opacity: 0;
  }

  100% {
    transform: translateY(0px);
    opacity: 1;
  }
}

.open {
  display: block;
  animation: fade 0.2s ease-out;
}

@media(min-width: 768px){
  svg {
    width: 22px;
    height: 22px;
  }
}
</style>