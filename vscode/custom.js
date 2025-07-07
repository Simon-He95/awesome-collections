let titleCenter
const stop = useRaf(() => {
  titleCenter = document.querySelector('.titlebar-center')

  if (titleCenter) {
    stop()
    const styleContainer = `
    .signature {
      display: flex;
      align-items: center;
      justify-contents: center;
      margin-right: 10px;
    }
    @media (prefers-reduced-motion) {
      .signature .path {
        animation: none !important;
        stroke-dasharray: unset !important;
      }
    }
  
    @media print {
      .signature .path {
        animation: none !important;
        stroke-dasharray: unset !important;
      }
    }
  
    @keyframes grow {
      0% {
        stroke-dashoffset: 1px;
        stroke-dasharray: 0 3000px;
        opacity: 0;
      }
  
      10% {
        opacity: 1;
      }
  
      40% {
        stroke-dasharray: 3000px 0;
      }
  
      85% {
        stroke-dasharray: 3000px 0;
      }
  
      95%,
      to {
        stroke-dasharray: 0 3000px;
      }
    }
  
    .signature .path {
      fill: transparent;
      stroke-width: 8px;
      stroke-linecap: round;
      stroke-linejoin: round;
      stroke-dashoffset: 1px;
      stroke-dasharray: 3000px 0;
      animation: grow 10s ease forwards infinite;
      transform-origin: center;
      stroke: #fdfdfd;
    }
  
  /* 暗色模式样式 */
  @media (prefers-color-scheme: dark) {
    .signature .path {
      stroke: #fdfdfd;
    }
  }
  `
    const style = document.createElement('style')
    style.innerHTML = styleContainer
    document.head.appendChild(style)
    const node = document.createElement('div')
    node.setAttribute('class', 'signature')
    node.innerHTML = ` <svg version="1.0" xmlns="http://www.w3.org/2000/svg" fill="none" width="70pt" height="25pt"
      viewBox="0 0 280.000000 100.000000" preserveAspectRatio="xMidYMid meet">
      <title>Simon He @ simonhe.me</title>
      <g transform="translate(0.000000,100.000000) scale(0.100000,-0.100000)" fill="none" stroke="none">
        <path class="path" d="M669 891 c-76 -79 -109 -150 -109 -234 0 -61 10 -51 -235 -225 -224
  -159 -295 -231 -295 -299 0 -75 76 -100 124 -42 21 24 24 34 15 45 -18 21 -30
  17 -24 -9 5 -18 1 -26 -20 -35 -38 -18 -53 -15 -71 13 -21 32 -12 71 28 120
  32 38 182 153 333 255 44 30 92 65 107 78 28 26 48 23 48 -8 0 -11 7 -45 15
  -77 8 -31 15 -72 15 -90 0 -31 -2 -33 -38 -33 -90 0 -244 -64 -278 -115 -21
  -32 -11 -56 32 -80 31 -17 42 -18 90 -7 70 14 139 62 177 123 16 27 37 49 45
  49 8 0 32 -18 52 -40 20 -22 40 -37 43 -34 10 10 -32 57 -66 76 -29 14 -33 23
  -43 85 -7 37 -18 94 -25 126 l-13 57 66 68 c72 73 115 137 148 221 23 60 16
  81 -29 81 -19 0 -43 -18 -92 -69z m116 39 c3 -5 -11 -44 -31 -86 -25 -53 -57
  -98 -105 -148 l-68 -71 -1 41 c0 74 28 133 100 206 62 64 91 80 105 58z m-202
  -617 c-33 -92 -175 -170 -259 -143 -50 17 -43 54 18 94 43 28 159 65 205 65
  36 1 41 -2 36 -16z" />
        <path class="path" d="M2160 816 c-101 -23 -171 -73 -186 -133 -8 -28 18 -70 52 -85 21 -10
  24 -16 18 -42 l-6 -31 22 28 c17 22 30 27 63 27 46 0 106 25 151 63 36 30 30
  57 -13 57 -44 0 -81 -17 -133 -61 -26 -21 -57 -39 -70 -39 -32 0 -68 35 -68
  65 0 39 72 102 139 123 75 23 205 23 248 -1 61 -33 65 -133 8 -219 -25 -38
  -29 -40 -63 -34 -77 15 -118 17 -132 6 -13 -9 -12 -13 9 -30 24 -21 51 -26 51
  -11 0 5 -10 11 -22 14 -20 3 -21 4 -5 11 22 10 107 -2 107 -15 0 -20 -102
  -109 -167 -146 -37 -20 -61 -39 -55 -41 20 -6 133 70 194 131 51 50 63 57 98
  57 22 0 40 -2 40 -5 0 -3 -14 -28 -31 -56 -35 -56 -49 -130 -29 -154 7 -8 26
  -15 43 -15 38 0 147 50 147 67 0 18 -7 16 -46 -13 -20 -16 -52 -29 -78 -31
  -38 -5 -46 -2 -56 17 -16 30 -6 64 41 136 33 51 47 64 93 83 68 28 126 88 126
  131 0 22 -5 30 -18 30 -29 0 -88 -46 -128 -102 -47 -65 -51 -68 -91 -68 -31 0
  -43 12 -24 24 20 13 51 99 51 142 0 61 -27 98 -87 118 -54 19 -115 19 -193 2z
  m115 -135 c13 -21 -94 -81 -144 -81 -26 1 -26 1 12 35 21 18 55 38 75 43 50
  13 50 13 57 3z m348 -39 c-26 -34 -82 -78 -112 -87 -23 -7 -22 -5 10 40 35 49
  111 103 118 84 2 -6 -5 -23 -16 -37z" />
        <path class="path" d="M835 619 c-10 -15 3 -25 16 -12 7 7 7 13 1 17 -6 3 -14 1 -17 -5z" />
        <path class="path" d="M980 527 c-14 -7 -62 -41 -107 -74 -73 -54 -136 -84 -149 -70 -2 2 9
  30 26 62 41 77 38 92 -5 25 -40 -64 -46 -110 -15 -110 28 0 90 27 115 49 42
  38 157 111 176 111 17 0 16 -4 -11 -49 -31 -50 -40 -101 -17 -101 6 0 30 11
  52 25 96 58 99 59 90 39 -28 -69 -10 -71 65 -9 59 48 76 56 65 28 -42 -106
  -33 -141 25 -98 19 14 35 25 35 25 1 0 1 -19 1 -41 -1 -58 16 -59 70 -6 39 40
  49 45 77 40 27 -4 47 5 129 61 123 84 141 86 97 12 -37 -63 -21 -71 45 -21 62
  46 74 50 58 18 -15 -30 -21 -78 -12 -93 8 -13 17 -11 57 12 26 14 49 32 51 38
  3 7 -17 0 -42 -15 -26 -15 -50 -25 -53 -22 -3 4 2 29 11 56 9 27 16 55 16 60
  0 18 -30 12 -63 -13 -53 -38 -56 -38 -34 3 17 30 19 43 11 51 -14 14 -27 8
  -148 -71 -48 -33 -94 -59 -101 -59 -33 0 -44 12 -38 42 8 38 -12 74 -50 89
  -26 11 -31 10 -43 -6 -8 -11 -11 -27 -8 -38 9 -29 -14 -70 -53 -95 -20 -12
  -38 -20 -41 -18 -3 3 3 25 12 49 9 23 16 50 16 60 0 29 -45 20 -90 -18 -45
  -38 -59 -40 -41 -7 13 25 14 42 2 42 -5 0 -42 -23 -83 -50 -40 -28 -74 -47
  -76 -42 -1 5 11 35 28 66 16 32 27 62 24 67 -8 13 -45 11 -74 -4z m442 -34
  c21 -19 25 -73 4 -73 -7 0 -19 7 -27 16 -10 13 -10 17 2 25 12 7 11 9 -3 9
  -20 0 -32 16 -23 30 9 15 26 12 47 -7z m-25 -127 c-10 -14 -26 -30 -37 -36
  -17 -9 -20 -8 -20 11 0 11 7 37 16 56 l17 34 20 -20 c19 -19 19 -21 4 -45z" />
        <path class="path" d="M2628 493 c-45 -49 -58 -75 -51 -102 8 -36 22 -51 47 -51 25 0 116
  55 116 70 0 5 -21 -4 -47 -20 -54 -34 -78 -38 -92 -12 -8 15 -3 22 26 38 35
  18 73 66 73 92 0 22 -46 13 -72 -15z m52 -1 c0 -12 -59 -66 -65 -60 -7 7 43
  68 56 68 5 0 9 -4 9 -8z" />
      </g>
    </svg>`
    titleCenter.insertBefore(node, titleCenter.firstChild)
    // 监听鼠标点击事件
    window.addEventListener('dblclick', (e) => {
      const target = e.target
      if (target.className === 'label-name') {
        // 将这个名字复制到剪贴板
        const name = target.innerText
        copyText(name)
      }
    })

    // 添加 avatar
    const avatar = document.createElement('img')
    avatar.src =
      'data:image/jpeg;base64,/9j/2wCEAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDIBCQkJDAsMGA0NGDIhHCEyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMv/AABEIAEAAQAMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/ANv4c2klpZSkTm4tjKoVACXhYg8jH9B2q7J4/j0My2wjSW4RinzHCgBm59ehHHFefad4g1DTby4ltbj7Oky4dYl2j8PT8K53WL+S5umkdy7E5LE55/rXPC9zuxFB0naSseyWfxNd2DT/AGcLnngj8q3k8VaXqdrI2doXBDE5Ac9CD65r5xjuTkCRiB7/AOFdd4c1G2MU1lIrOJcFWxyrDpyP/rVTUl1OduL2R7zbf6eiSyptVRke5I5qwgOzCnCKoG7Gc8Vx3g3xFcXCvYXsqS+XjawXBHTA/L+VdjaMzWe6TC5LAfmQM1UWnoQ00TgBR5adAOBnrUqE45x+FUbK4FyHkDAhnIGBzgf/AF6uQuJFZl6biPy4P61oiT5eSJ5/3Sk7sHJHoAT/AErNa0lllaKJJG298ZxWtpbX8XiC1t1s5YLtWG9LiMgov8WRwfuk16LDpdrawSKsaB3csSB/ntXLdw3PWxbhVqXg7o8iGj3oYFoJFUn7xWun0vSRbwCZTk+vvWvf6TJLOpt5HVwxIG7io9Skm0xII1iLSSj5iuOPfk0Oo5GCpKOpN4S1pbLXryK5IL7VKfmf8/nXoXiLxZb6bbJFuLNdKGjijGXz3wB06D868jstPu18R/a7hDtMQfJXGV9cV1NvYzi4utTixNNNN5MQLD93Gh2kjI7kE0k7SIcU15nRaR4323Udv/ZzxSXU5WOFyRjpzk8fh7V2trdRxWB8uZJPLGN2Rzxk5x+NeOeIbxTC8GB5ijcCDggjuP8A9dVvBfiSe4S5ibM0wYOELgAnoev1z+FUpyWqM5U0bl/qcbatO6Z2D5sliSSeTjPTnsMCpFvo5U80twBmue1tJLa5JXlF+XPt1H86m0aOe6IjiG5m6LU1VZm1B3jctvqUf+tQbv8AZPBqC7ke/wASQx7pMbY1bgZ7ZParF1omqy3MVvJZlEJ++wG0D1zXc6BbaJpTkW1sqXMUaxtKxJLDJycdAaUIXKq1VFWR5lr+t2tjAkbl5L60iKom3YAcHJPqP54pfDOsrqPhmJY7kJd2+5JEJxnJyG9f8muw8Z+CrbxLI1xBJtumBBKjGfTI7153B4fk0O6e3Gd55LMMYq5xtHUwpT97Qt69rkdpo7W7FJLlhjapyR71z/w/mWHxRCZPutGxxnvjIr0XUvh9py+Dr82ozqBH2hZCck8fMp/EH9K8p8NlotagcfejlGR7Hgj9aIWUWE25SR6XeRGW8tgwGy5HkEnoHGSv58j64rstD8IR6TF9rdyssSMDtc7WJGNpHQ4P602DQbW4jAly6E/KAeQe2D6irV54kSLSZVmVZL21O25RMAFgcbvTB4bAyRmqlJPfoKnSqNpR6kOt34hltY9wDMG2jucYz/OuZXUjDqd+CdoVlwc9SwXn+QrN1a71DVNRRljdp4nVlUdIWHysD/snBP4isrxHJLHrU6I2A6oevTAH+FTHVGuIoui0m9Weg22tGSZJJHHKAcdyeapXtzYapOqyRKZM8SDrgY4/z6Vw8WoeVZzSz32yOJOTnp7fU8VzT+Npob/zLOI+QBgCVvmbnJPHT9av3pKyOdcsZJs9s1a2v7fw3cXlon2pPIfesXLD5T2/HtXhvhOdV8QRSS7TiQOQ3Q4OcV6J4X+IQnwYpTFKPvxMf85rp5dKtfEAN7oVxDp2sZ3SJ5SGO4+oIIB98fUGs11i9zR3XvLVH//Z'
    avatar.className = 'simon-avatar'
    const p = document.querySelector(
      '.monaco-workbench .part.titlebar>.titlebar-container .action-toolbar-container .monaco-action-bar',
    )
    p.appendChild(avatar)
    avatar.addEventListener('mouseenter', (e) => {
      avatar.style.transform = 'scale(1.2)' // 鼠标悬停时放大
    })
    avatar.addEventListener('mouseleave', (e) => {
      avatar.style.transform = 'scale(1)' // 鼠标离开时恢复原状
    })
    avatar.addEventListener('click', (e) => {
      window.open('https://simonhe.me', '_blank')
    })
  }
})

// 添加 clipboard fallback 方法
function copyText(text) {
  if (navigator.clipboard && window.isSecureContext) {
    navigator.clipboard.writeText(text).then(
      () => {
        console.log('复制成功')
      },
      (err) => {
        // fallback
        fallbackCopyTextToClipboard(text)
      },
    )
  } else {
    fallbackCopyTextToClipboard(text)
  }
}

function fallbackCopyTextToClipboard(text) {
  const textarea = document.createElement('textarea')
  textarea.value = text
  textarea.style.position = 'fixed'
  textarea.style.top = '-9999px'
  document.body.appendChild(textarea)
  textarea.focus()
  textarea.select()
  try {
    document.execCommand('copy')
    console.log('复制成功')
  } catch (err) {
    console.error('复制失败', err)
  }
  document.body.removeChild(textarea)
}

function useRaf(fn, options = {}) {
  let start
  let isStopped = false
  let rafId
  const { immediate, delta = 0, autoStop } = options
  const animationFrame =
    window.requestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.msRequestAnimationFrame ||
    ((fn) => setTimeout(fn, 1000 / 60))
  const cancelAnimation =
    window.cancelAnimationFrame ||
    window.webkitCancelAnimationFrame ||
    window.mozCancelAnimationFrame ||
    window.oCancelAnimationFrame ||
    window.msCancelAnimationFrame ||
    clearTimeout
  const stop = () => {
    isStopped = true
    cancelAnimation(rafId)
  }
  rafId = animationFrame(function myFrame(timestamp = Date.now()) {
    if (isUndef(start)) {
      start = timestamp
      if (immediate) {
        // 首次立即执行
        fn?.(timestamp)
      }
    } else if (isStopped) {
      return
    } else if (timestamp - start > delta) {
      fn?.(timestamp)
      start = timestamp
      if (autoStop) {
        stop()
        return
      }
    }
    rafId = animationFrame(myFrame)
  })

  return stop
}

function isUndef(o) {
  return typeof o === 'undefined'
}
