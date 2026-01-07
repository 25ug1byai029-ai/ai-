<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkyWrite AI - Professional Writing Engine</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,700;1,800&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: #0a0d2e;
            color: #f8fafc;
        }
        .starfield {
            background-color: #0a0d2e;
            background-image: 
                radial-gradient(1px 1px at 20px 30px, #eee, rgba(0,0,0,0)),
                radial-gradient(1px 1px at 40px 70px, #fff, rgba(0,0,0,0)),
                radial-gradient(2px 2px at 50px 160px, #ddd, rgba(0,0,0,0)),
                radial-gradient(2px 2px at 90px 40px, #fff, rgba(0,0,0,0)),
                radial-gradient(1px 1px at 130px 80px, #fff, rgba(0,0,0,0)),
                radial-gradient(1px 1px at 160px 120px, #ddd, rgba(0,0,0,0));
            background-repeat: repeat;
            background-size: 200px 200px;
            animation: stars 100s linear infinite;
        }
        @keyframes stars {
            from { background-position: 0 0; }
            to { background-position: 1000px 1000px; }
        }
        @keyframes loading-bar {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(600%); }
        }
        .animate-loading-bar {
            animation: loading-bar 4s infinite ease-in-out;
        }
        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #1e293b;
            border-radius: 10px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #334155;
        }
        .glass-panel {
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.05);
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body class="overflow-x-hidden">
    <div class="min-h-screen flex flex-col md:flex-row">
        <!-- Sidebar - Historical Vault -->
        <aside class="w-full md:w-80 border-r border-white/5 bg-slate-900/50 backdrop-blur-3xl overflow-y-auto hidden md:flex flex-col custom-scrollbar">
            <div class="p-8 border-b border-white/5 bg-black/20">
                <h2 class="font-black text-xs uppercase tracking-[0.4em] text-indigo-400 flex items-center gap-3">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    Historical Archive
                </h2>
            </div>
            <div id="history-list" class="flex-1"></div>
        </aside>

        <!-- Main Command Center -->
        <main class="flex-1 flex flex-col h-screen overflow-hidden starfield">
            <!-- Navigation & Brand -->
            <header class="h-32 border-b border-white/5 flex items-center justify-between px-12 shrink-0 glass-panel z-20">
                <div class="flex items-center gap-8">
                    <svg viewBox="0 0 200 200" class="h-20 w-20 drop-shadow-[0_0_15px_rgba(79,70,229,0.5)]">
                        <defs>
                            <linearGradient id="mainGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                                <stop offset="0%" stop-color="#0a0d2e" />
                                <stop offset="50%" stop-color="#4f46e5" />
                                <stop offset="100%" stop-color="#a855f7" />
                            </linearGradient>
                            <linearGradient id="electricBlue" x1="0%" y1="0%" x2="100%" y2="0%">
                                <stop offset="0%" stop-color="#38bdf8" />
                                <stop offset="100%" stop-color="#818cf8" />
                            </linearGradient>
                            <filter id="glow">
                                <feGaussianBlur stdDeviation="3" result="coloredBlur" />
                                <feMerge>
                                    <feMergeNode in="coloredBlur" />
                                    <feMergeNode in="SourceGraphic" />
                                </feMerge>
                            </filter>
                        </defs>
                        <path d="M100 40C70 40 50 60 45 80C40 75 30 75 25 85C20 95 25 115 45 120C45 140 65 160 100 160C135 160 155 140 155 120C175 115 180 95 175 85C170 75 160 75 155 80C150 60 130 40 100 40Z" fill="url(#mainGradient)" opacity="0.9"/>
                        <g stroke="rgba(255,255,255,0.2)" stroke-width="1.5">
                            <path d="M70 70H130M70 100H130M70 130H100"/>
                            <path d="M85 60V140M115 60V110"/>
                            <circle cx="130" cy="70" r="3" fill="#38bdf8"/>
                            <circle cx="130" cy="100" r="3" fill="#a855f7"/>
                            <circle cx="70" cy="70" r="2" fill="white"/>
                        </g>
                        <path d="M40 160C60 160 120 150 145 75" stroke="url(#electricBlue)" stroke-width="6" stroke-linecap="round" filter="url(#glow)" class="animate-pulse"/>
                        <path d="M140 85L145 75L155 80" stroke="url(#electricBlue)" stroke-width="4" stroke-linecap="round"/>
                        <g fill="white" opacity="0.8">
                            <path d="M140 40L150 45L140 50L145 45L140 40Z"/>
                            <path d="M160 30L170 35L160 40L165 35L160 30Z"/>
                            <path d="M120 20L130 25L120 30L125 25L120 20Z"/>
                        </g>
                    </svg>
                    <div class="h-12 w-px bg-white/10"></div>
                    <div class="flex flex-col">
                        <h1 class="font-[900] italic text-5xl tracking-tighter text-white uppercase leading-none">
                            SKYWRITE <span class="text-indigo-400 not-italic">AI</span>
                        </h1>
                        <span class="text-[10px] font-black text-indigo-300/40 uppercase tracking-[0.6em] mt-2 block">
                            Precision Intelligence Engine
                        </span>
                    </div>
                </div>
                <div class="flex items-center gap-6">
                    <div class="hidden lg:flex items-center gap-3 px-5 py-2 bg-indigo-500/10 border border-indigo-500/20 rounded-full">
                        <svg class="w-4 h-4 text-indigo-400 animate-pulse" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                        </svg>
                        <span class="text-[10px] font-black text-indigo-100 uppercase tracking-widest">Neural Link: v3.0 Pro</span>
                    </div>
                </div>
            </header>

            <!-- Dynamic Workspace -->
            <div class="flex-1 overflow-y-auto p-8 md:p-16 space-y-16 custom-scrollbar">
                <section class="max-w-7xl mx-auto w-full grid grid-cols-1 lg:grid-cols-2 gap-12">
                    <!-- Input Terminal -->
                    <div class="flex flex-col space-y-6">
                        <div class="flex items-center justify-between px-6">
                            <div class="flex items-center gap-3">
                                <div class="w-2 h-6 bg-indigo-500 rounded-full shadow-[0_0_15px_rgba(99,102,241,0.6)]"></div>
                                <label class="text-xs font-black text-slate-500 uppercase tracking-[0.2em]">Source Manuscript</label>
                            </div>
                            <span id="char-count" class="text-[10px] font-black text-indigo-400/60 bg-indigo-500/10 px-4 py-1.5 rounded-full border border-indigo-500/20">0 CHAR</span>
                        </div>
                        <div class="relative group">
                            <textarea
                                id="input-text"
                                placeholder="Insert your text here. Let the engine perfect every word..."
                                class="w-full h-[550px] p-12 rounded-[3.5rem] border border-white/5 outline-none transition-all text-slate-100 bg-slate-900/40 backdrop-blur-xl shadow-2xl leading-relaxed text-2xl font-medium resize-none placeholder:text-slate-700 focus:border-indigo-500/50"
                            ></textarea>
                        </div>
                    </div>

                    <!-- Parameter Matrix -->
                    <div class="flex flex-col justify-between space-y-8">
                        <div class="bg-slate-900/40 backdrop-blur-2xl p-16 rounded-[4rem] border border-white/5 shadow-2xl flex flex-col justify-between h-full">
                            <div class="space-y-10">
                                <label class="text-xs font-black text-slate-500 block uppercase tracking-[0.3em] px-4">Refinement Profiles</label>
                                <div class="grid grid-cols-2 gap-4" id="tone-buttons">
                                    <!-- Tone buttons will be inserted here -->
                                </div>
                            </div>

                            <div class="space-y-10 pt-16">
                                <div class="flex items-center justify-between bg-black/20 p-8 rounded-[2.5rem] border border-white/5 transition-all hover:bg-indigo-500/5 hover:border-indigo-500/20">
                                    <div class="flex items-center gap-6">
                                        <div class="p-5 bg-indigo-600 rounded-3xl shadow-2xl">
                                            <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                            </svg>
                                        </div>
                                        <div>
                                            <label class="text-base font-black text-slate-100 block tracking-tight">Trace Logic</label>
                                            <p class="text-[10px] text-slate-500 font-bold uppercase tracking-widest mt-1">Expose AI reasoning map</p>
                                        </div>
                                    </div>
                                    <label class="relative inline-flex items-center cursor-pointer">
                                        <input type="checkbox" id="show-explanations" class="sr-only peer" checked>
                                        <div class="w-16 h-8 bg-slate-800 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[4px] after:left-[4px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-6 after:w-6 after:transition-all peer-checked:bg-indigo-600"></div>
                                    </label>
                                </div>

                                <button
                                    id="enhance-btn"
                                    class="w-full py-10 bg-indigo-600 hover:bg-indigo-500 disabled:bg-slate-800 disabled:text-slate-600 disabled:cursor-not-allowed text-white font-black rounded-[3rem] transition-all shadow-[0_40px_60px_-15px_rgba(79,70,229,0.5)] flex items-center justify-center gap-6 group transform active:scale-95"
                                >
                                    <svg class="w-8 h-8 group-hover:rotate-45 transition-transform duration-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path>
                                    </svg>
                                    <span class="text-xl tracking-[0.2em] uppercase italic">Execute Refinement</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Enhancement Results -->
                <div id="results-section" class="hidden max-w-7xl mx-auto w-full pb-60"></div>
            </div>
            
            <!-- Footer -->
            <footer class="h-24 border-t border-white/5 bg-black/40 backdrop-blur-3xl flex items-center justify-between px-16 shrink-0 z-20">
                <div class="flex items-center gap-8">
                    <span class="text-[10px] font-black text-slate-600 uppercase tracking-[0.8em]">SkyWrite Intelligence Fabric v3.0.4-PRO</span>
                </div>
                <div class="flex items-center gap-12">
                    <p class="text-[11px] text-indigo-400 font-black uppercase tracking-[0.5em] bg-indigo-500/10 px-8 py-3 rounded-2xl border border-indigo-500/20">
                        Enterprise Neural Grid Active
                    </p>
                </div>
            </footer>
        </main>
    </div>

    <script>
        const API_BASE_URL = 'http://localhost:5000/api';
        
        let history = JSON.parse(localStorage.getItem('skywrite_history') || '[]');
        let currentTone = 'original';
        let activeResult = null;

        const tones = ['original', 'professional', 'casual', 'academic', 'creative'];

        // Initialize
        document.addEventListener('DOMContentLoaded', () => {
            initializeToneButtons();
            renderHistory();
            
            const inputText = document.getElementById('input-text');
            const charCount = document.getElementById('char-count');
            const enhanceBtn = document.getElementById('enhance-btn');
            
            inputText.addEventListener('input', () => {
                charCount.textContent = `${inputText.value.length} CHAR`;
            });
            
            enhanceBtn.addEventListener('click', handleEnhance);
        });

        function initializeToneButtons() {
            const container = document.getElementById('tone-buttons');
            tones.forEach(tone => {
                const btn = document.createElement('button');
                btn.textContent = tone;
                btn.className = `px-8 py-6 rounded-3xl text-sm font-black capitalize transition-all border-2 ${
                    tone === currentTone 
                        ? 'bg-indigo-600 text-white border-indigo-400 shadow-[0_20px_40px_-10px_rgba(79,70,229,0.4)] scale-[1.05]' 
                        : 'bg-white/5 text-slate-500 border-white/5 hover:border-indigo-500/30 hover:text-indigo-400'
                }`;
                btn.onclick = () => selectTone(tone);
                container.appendChild(btn);
            });
        }

        function selectTone(tone) {
            currentTone = tone;
            const buttons = document.querySelectorAll('#tone-buttons button');
            buttons.forEach((btn, idx) => {
                if (tones[idx] === tone) {
                    btn.className = 'px-8 py-6 rounded-3xl text-sm font-black capitalize transition-all border-2 bg-indigo-600 text-white border-indigo-400 shadow-[0_20px_40px_-10px_rgba(79,70,229,0.4)] scale-[1.05]';
                } else {
                    btn.className = 'px-8 py-6 rounded-3xl text-sm font-black capitalize transition-all border-2 bg-white/5 text-slate-500 border-white/5 hover:border-indigo-500/30 hover:text-indigo-400';
                }
            });
        }

        async function handleEnhance() {
            const inputText = document.getElementById('input-text').value;
            const showExplanations = document.getElementById('show-explanations').checked;
            
            if (!inputText.trim()) return;
            
            showLoading();
            
            try {
                const response = await fetch(`${API_BASE_URL}/enhance`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        text: inputText,
                        tone: currentTone,
                        showExplanations: showExplanations
                    })
                });
                
                if (!response.ok) {
                    const error = await response.json();
                    throw new Error(error.error || 'Failed to enhance text');
                }
                
                const result = await response.json();
                
                const historyItem = {
                    id: Math.random().toString(36).substr(2, 9),
                    timestamp: Date.now(),
                    originalText: inputText,
                    enhancedText: result.correctedText,
                    tone: currentTone,
                    improvements: result.improvements || []
                };
                
                history = [historyItem, ...history].slice(0, 20);
                localStorage.setItem('skywrite_history', JSON.stringify(history));
                
                activeResult = historyItem;
                renderHistory();
                showResult(historyItem);
                
            } catch (error) {
                showError(error.message);
            }
        }

        function showLoading() {
            const resultsSection = document.getElementById('results-section');
            resultsSection.classList.remove('hidden');
            resultsSection.innerHTML = `
                <div class="bg-slate-900/40 border border-white/5 p-40 rounded-[5rem] flex flex-col items-center justify-center text-center space-y-12 shadow-2xl backdrop-blur-3xl relative overflow-hidden">
                    <div class="absolute top-0 left-0 w-full h-2.5 bg-white/5 overflow-hidden">
                        <div class="h-full bg-indigo-500 w-1/4 animate-loading-bar shadow-[0_0_20px_#6366f1]"></div>
                    </div>
                    <div class="relative scale-125">
                        <svg viewBox="0 0 24 24" class="w-20 h-20 text-indigo-400 animate-spin">
                            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" fill="none"></circle>
                            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                    </div>
                    <div>
                        <h3 class="font-[900] italic text-5xl text-white tracking-tighter uppercase">SYNTHESIZING...</h3>
                        <p class="text-indigo-400/60 text-sm font-black uppercase tracking-[0.8em] mt-10 animate-pulse">Calibrating Syntax & Flow</p>
                    </div>
                </div>
            `;
        }

        function showError(message) {
            const resultsSection = document.getElementById('results-section');
            resultsSection.classList.remove('hidden');
            resultsSection.innerHTML = `
                <div class="bg-red-500/10 border-2 border-red-500/20 text-red-400 p-16 rounded-[4rem] flex items-start gap-10 shadow-2xl backdrop-blur-xl">
                    <svg class="w-16 h-16 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <div>
                        <h4 class="font-black text-3xl mb-3 uppercase tracking-tighter italic">System Critical Error</h4>
                        <p class="text-xl font-medium opacity-80">${message}</p>
                    </div>
                </div>
            `;
        }

        function showResult(result) {
            const resultsSection = document.getElementById('results-section');
            resultsSection.classList.remove('hidden');
            
            let improvementsHTML = '';
            if (result.improvements && result.improvements.length > 0) {
                improvementsHTML = `
                    <div class="space-y-16 mt-32">
                        <div class="flex items-center gap-8 pl-12">
                            <div class="w-4 h-20 bg-indigo-600 rounded-full shadow-[0_0_30px_#6366f1]"></div>
                            <h4 class="font-black text-white text-5xl tracking-tighter uppercase italic">Neural Insight Log</h4>
                        </div>
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
                            ${result.improvements.map((imp, idx) => `
                                <div class="bg-slate-900/40 p-16 rounded-[4rem] border border-white/5 shadow-2xl hover:border-indigo-500/30 transition-all group flex flex-col justify-between border-l-[24px] border-l-indigo-600/10 hover:border-l-indigo-600 duration-500">
                                    <div class="flex flex-col space-y-12">
                                        <div class="flex items-center gap-8">
                                            <span class="w-20 h-20 rounded-[2rem] bg-indigo-600/20 text-indigo-400 flex items-center justify-center text-3xl font-black border border-indigo-500/20">${idx + 1}</span>
                                            <p class="text-2xl font-black text-white uppercase tracking-tighter italic opacity-80">${imp.reason}</p>
                                        </div>
                                        <div class="space-y-10">
                                            <div class="p-10 bg-red-500/5 rounded-[2.5rem] text-xl text-red-400/40 font-bold border border-red-500/10 italic">
                                                "${imp.original}"
                                            </div>
                                            <div class="flex justify-center">
                                                <div class="bg-slate-800 p-6 rounded-full border border-white/5 shadow-2xl">
                                                    <svg class="w-10 h-10 text-indigo-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="p-12 bg-indigo-500/10 rounded-[3rem] text-3xl text-indigo-200 font-black border border-indigo-500/20 shadow-inner leading-tight">
                                                "${imp.fixed}"
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            `).join('')}
                        </div>
                    </div>
                `;
            }
            
            resultsSection.innerHTML = `
                <div class="space-y-32">
                    <div class="bg-slate-900/60 border border-indigo-500/20 rounded-[5rem] shadow-[0_80px_160px_-40px_rgba(0,0,0,0.8)] overflow-hidden transition-all duration-1000 group">
                        <div class="bg-indigo-600/10 px-16 py-12 flex items-center justify-between border-b border-white/5">
                            <div class="flex items-center gap-8">
                                <svg class="w-12 h-12 text-indigo-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                                <span class="text-xl font-black text-indigo-100 uppercase tracking-[0.6em] italic">Final Rendition</span>
                            </div>
                            <button onclick="copyToClipboard('${result.enhancedText.replace(/'/g, "\\'")}', this)" class="bg-white/5 text-white hover:bg-indigo-600 transition-all p-8 rounded-[2.5rem] backdrop-blur-3xl border border-white/5 shadow-2xl">
                                <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"></path>
                                </svg>
                            </button>
                        </div>
                        <div class="p-20 md:p-40 bg-gradient-to-br from-transparent via-indigo-500/[0.02] to-violet-500/[0.05]">
                            <p class="text-4xl md:text-5xl leading-[1.3] text-white font-medium tracking-tight whitespace-pre-wrap selection:bg-indigo-500/50">
                                ${result.enhancedText}
                            </p>
                        </div>
                    </div>
                    ${improvementsHTML}
                </div>
            `;
        }

        function copyToClipboard(text, btn) {
            navigator.clipboard.writeText(text);
            btn.innerHTML = `
                <svg class="w-10 h-10 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
            `;
            setTimeout(() => {
                btn.innerHTML = `
                    <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00
