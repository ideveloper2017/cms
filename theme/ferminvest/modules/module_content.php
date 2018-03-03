<?php
$params = unserialize($inMod['params']);
?>
    <section class="<?php if ($inMod['css_prefix']) { ?><?php echo $inMod['css_prefix'] ?>" <?php } ?>">
    <div class="auto-container">

<?php
if ($inMod['showtitle']) {
    echo '<div class="sec-title-one">';
    echo '<h2>' . $inMod['title'] . '</h2>';
    echo '</div>';
}

print $inMod['body'] . $inMod['jscode'];
print "</div>";

print "</section>";
?>