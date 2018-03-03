<?php
$params = unserialize($inMod['params']);
?>
<div class="widget sidebar-widget <?php if ($inMod['css_prefix']) { ?><?php echo $inMod['css_prefix'] ?>" <?php } ?>">
<?php
if ($inMod['showtitle']) {
    echo '<div class="sidebar-title"><h3>' . $inMod['title'] . '</h3></div>';
}

print $inMod['body'] . $inMod['jscode'];
?>
</div>
