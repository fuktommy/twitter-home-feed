{* -*- coding: utf-8 -*- *}
{* Copyright (c) 2011-2016 Satoshi Fukutomi <info@fuktommy.com>. *}
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="/atomfeed.xsl" type="text/xsl"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <title>twitter home timeline</title>
  {* <subtitle></subtitle> *}
  {* <link rel="self" href="{$config.site_top}" /> *}
  <link rel="alternate" href="https://twitter.com/" type="text/html"/>
  <updated>{$feed[0].created_at|atom_date|escape}</updated>
  <generator>https://github.com/fuktommy/twitter-home-feed</generator>
  <id>tag:fuktommy.com,2016:twitter/home-feed</id>
  {* <author><name></name></author> *}
  <icon>{$config.site_top}favicon.ico</icon>
{foreach from=$feed item="entry"}
  {if empty($entry.user.protected)}
  {include assign="content" file="content.tpl" entry=$entry}
  <entry>
    <title type="html">{$content|strip_tags|regex_replace:'/\s+/':' '|htmlspecialchars_decode:$smarty.const.ENT_QUOTES|regex_replace:'/\s+/':' '|trim|mbtruncate:60|escape|default:"untitled"}</title>
    <link rel="alternate" href="https://twitter.com/{$entry.user.screen_name|escape:"url"}/status/{$entry.id_str|escape:"url"}"/>
    <summary type="html">{$content|strip_tags|regex_replace:'/\s+/':' '|escape}</summary>
    <content type="html"><![CDATA[
        {$content|replace:"]]>":""}
    ]]></content>
    <published>{$entry.created_at|atom_date|escape}</published>
    <updated>{$entry.created_at|atom_date|escape}</updated>
    {strip}
    <author><name>
        {$entry.user.screen_name|escape} - {$entry.user.name|escape}
    </name></author>
    {/strip}
    <id>tag:fuktommy.com,2016:twitter/home-feed/{$entry.id_str|escape}</id>
    {* <rights></rights> *}
  </entry>
  {/if}
{/foreach}
</feed>
