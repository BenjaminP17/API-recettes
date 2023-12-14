<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231214121847 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE ingredient_quantity (ingredient_id INT NOT NULL, quantity_id INT NOT NULL, INDEX IDX_EDF546B8933FE08C (ingredient_id), INDEX IDX_EDF546B87E8B4AFC (quantity_id), PRIMARY KEY(ingredient_id, quantity_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE ingredient_quantity ADD CONSTRAINT FK_EDF546B8933FE08C FOREIGN KEY (ingredient_id) REFERENCES ingredient (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE ingredient_quantity ADD CONSTRAINT FK_EDF546B87E8B4AFC FOREIGN KEY (quantity_id) REFERENCES quantity (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE ingredient_quantity DROP FOREIGN KEY FK_EDF546B8933FE08C');
        $this->addSql('ALTER TABLE ingredient_quantity DROP FOREIGN KEY FK_EDF546B87E8B4AFC');
        $this->addSql('DROP TABLE ingredient_quantity');
    }
}
