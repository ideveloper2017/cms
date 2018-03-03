<?php if ($items_found) { ?>
<section class="blog-classic-view post-details">
    <div class="news-style-one">
        <div class="inner-box">
    <?php if ($article['image']) { ?>
        <figure class="image-box">
                <img src="<?php echo $article['image']; ?>" alt="">
        </figure>

        <?php }?>

            <div class="lower-content">
        <h3><?php echo $article['title'] ?></h3>
        <span class="cs-post-meta-date">
            <i class="fa fa-calendar"></i> <?php echo $article['published']; ?>&nbsp;&nbsp; <i class="fa fa-eye"></i>  <?php echo $article['hits']; ?> </span>
                <div class="post-content">
                    <div class="text"><?php echo $article['content'] ?></div>
                </div>
            </div>

    <div class="single-list-tags">
        <label>	tags:</label>

        <?php if ($article['tags']) { ?>
            <?php echo $article['tags']; ?>
        <?php } ?>
    </div>

    <?php echo $article['plugins'] ?>
    </div>
    </div>
</section>
<?php } else {?>
    <div class="cs-404-page">
        <h3>404</h3>
        <h4>Сахифа топилмади!!!</h4>
        <!--        <p>But don't worry, it can happen to the best of us - and it just happen to you!<br>-->
        <!--            You can search something else or read this text one more time.</p>-->
        <a href="/" class="cs-404-page-back-link">Бош саҳифа</a>
    </div>
<?php } ?>

