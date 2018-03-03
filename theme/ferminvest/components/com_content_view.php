<section class="blog-classic-view">
<?php if ($items_found) { ?>
<!--    <h2 class="title-category-home"><a href="#">--><?php //echo $cattitle; ?><!--</a></h2>-->
    <?php
    $items = 1;
    foreach ($viewContent as $content) {
        ?>
        <div class="news-style-one">
            <div class="inner-box">
                <figure class="image-box">
                    <a href="<?php echo $content['slug']; ?>"><img src="<?php echo $content['first_image']?$content['first_image']:$content['image']; ?>" alt="<?php echo $content['title']; ?>"/></a>
                </figure>
                <div class="lower-content">
                    <h3><a href="<?php echo $content['slug']; ?>"><?php echo $content['title']; ?></a></h3>

                    <div class="text">
                    <?php echo $content['desc']; ?>
                    </div>
                    <div class="info clearfix">
                        <ul class="post-meta clearfix">
                            <li><span class="fa fa-clock-o"></span> <?php echo $content['date']; ?></li>
                            <li><span class="fa fa-eye-o"></span> <?php echo $content['hits']; ?></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>




<?php
    }
?>
</section>
    <div class="main-nosplit">
        <div class="page-pager">
            <?php if ($pager->display_pages()) { ?>
                <?php echo $pager->display_pages(); ?>
            <?php } ?>
        </div>
    </div>
<?php } else {?>
    <div class="cs-404-page">
        <h3>404</h3>
        <h4>Сахифа топилмади!!!</h4>
        <a href="/" class="cs-404-page-back-link">Бош саҳифа</a>
    </div>
<?php } ?>



