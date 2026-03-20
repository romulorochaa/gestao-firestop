-- ================================================================
-- GESTÃO PRO — Tabela de comentários do Gantt
-- Execute no SQL Editor do Supabase
-- ================================================================

create table if not exists public.gantt_comentarios (
  id uuid default gen_random_uuid() primary key,
  orcamento_id uuid references public.orcamentos(id) on delete cascade,
  texto text not null,
  autor text default 'Firestop',
  tipo_usuario text default 'interno' check (tipo_usuario in ('interno','cliente')),
  criado_em timestamptz default now()
);

-- Sem RLS (modo sem login ativo)
alter table public.gantt_comentarios disable row level security;

-- Índice para busca por obra
create index if not exists idx_gantt_comentarios_orc on public.gantt_comentarios(orcamento_id);
